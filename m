Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E08B286420
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464815; cv=none; b=t4F0+A6dOAvindIVbcaXovO4WdRav8LlFdIGt9DdpyrV1WoxxAEvd8/btlowfovWiw+3a1g2AMWzUPOiqCqj3A289TSMcxaIYiZzHtgGnX1U16rsOOO93OSXEI+Aanc5L1oc94NzaGTa1N9C/tmR73RyzVcNzEUereSSGlsMDNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464815; c=relaxed/simple;
	bh=Igg8LPA5rkVqnmQilm0fZ+YJ4MwpCHKJU6VZiksU+40=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A/X/zLeL36VRqcMpwL87rRQ3Yon5q5LbPAoHJjdQ1DjvPpV72kxtzokaFbpXc2kFdycgR3ObDpLVP+VbkQkSyNo9s/tMoURmven9rg/sGlmqJTG3fDhwgzPIZpN1wg/NcmFzPrFu4kwm/xr4mENAEdfKT47s2druDGHTNbH7gB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7sEBWIl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7sEBWIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751464812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Igg8LPA5rkVqnmQilm0fZ+YJ4MwpCHKJU6VZiksU+40=;
	b=P7sEBWIlhJPnpGr5soY4wpYfpmCRbM8mQcr/JBamNQTjmt0qcmGCaA9EXAFkqnaBQB9Yet
	sOFfDtSf1jrAnIyMNARBudI5hTEZgHwmeJDCsmliY9LHZJkLCXh/7XOkCLFRdCqWLv98CT
	xro48V9vuwS76oFn7FnRy7igSmq8ORo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-oD7GwOSdNbqTgAUJEB7Ijg-1; Wed, 02 Jul 2025 10:00:10 -0400
X-MC-Unique: oD7GwOSdNbqTgAUJEB7Ijg-1
X-Mimecast-MFC-AGG-ID: oD7GwOSdNbqTgAUJEB7Ijg_1751464805
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso2924128f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464805; x=1752069605;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Igg8LPA5rkVqnmQilm0fZ+YJ4MwpCHKJU6VZiksU+40=;
        b=Uzff4x3vYiEc6dm4VtObWB5HQj79VAlxLdDGZtNwRmJDi600RGgis7x6kqgNfYqsWZ
         ojqjcvErGmKRotaRLgOlgbE4PY5n+aW7m1ZsTtHnOv5rvHxBTiZDqTkNoVQMCni/+1F8
         jnNYrTCkzHG/O4XSW+QR3/Uudfdr19DePFiDxIKgrT30AHbd9KLFQB1lmkin8xlKxBKa
         jgKXbafP1fjQEH2RPCpUx7dZe/UgR1hQpuvFzUtNRwMRxTDYOsd7KA/42Odo+L9nxF4l
         IdQ/r0GemaGexbYTkv/h+RUV/UIRBr9Mlui0jNhTt8/v4uUVc3EFK3bJlCxnJ0He8A/1
         aqAg==
X-Forwarded-Encrypted: i=1; AJvYcCWrBncm8/kVeDtQRyQRL8UpO2hcp5PlBvDJLbSySMofGt8mpjH7EWG2dhrVvV/c3DD5qCMVa1/4obS15AM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxh+zF2Qe1e3cBjN/OC9mpLF3mnJ6p5dFlibsfLjULvbrBxtU6
	Zga/5Nb+HzekF8wVRqvbi/tkpcahrtOBglKAKwWxC3qDAzu+8VRQWrfUDZWBtKvm7iY4GXZhfXb
	85SAXflnllWH9PMBLfnH9Fg2D2GU3TvQhyKnIDa/FJC2L7xCczr8snVsZT/WYfqiMCA==
X-Gm-Gg: ASbGncuGTC+4mnt1iQSO6YKawvMN0lQs3B03X+HS6uDeEDlg+SmHF4eaHc75TXJM33j
	ihGhuq14P7ECbWZLa8stpPSiKl7jSkae1lt57BQlvk3fzc1t2KtQ2J7yH9mVMZC1TI38RJ0cfpQ
	MEYCDXAgQq0mB8nCyAwAoBVyNY2cik3x+fY2JmfOWpU/IFOSy2yfJU1/rBCCKOvaYVhHbc3Typ+
	ZQiM5Heo/i4bkgMPlrGGawYBHIcxurfJcWaPGtyrrFSTJXXSdXhVF4TQfUmok50IJRpYsBX8EQ+
	qKdbwtZOwFnHLWaGuw0wIXW1eUqjs8bgNkXYuIZFmaeqM52J
X-Received: by 2002:a05:6000:4a19:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3b1fdf01e8dmr2476860f8f.9.1751464804856;
        Wed, 02 Jul 2025 07:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhh3DXObw3vabrEO3JD4zSKfF5cOAA5+r3CQaJpyAnxxVMI5Xc1L04ZBUtO7UGZIGJ9rTm7A==
X-Received: by 2002:a05:6000:4a19:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3b1fdf01e8dmr2476807f8f.9.1751464804209;
        Wed, 02 Jul 2025 07:00:04 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b8f298c6sm25087955e9.1.2025.07.02.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:00:03 -0700 (PDT)
Message-ID: <de5654b277f424d56ac00b4b9d336491bafff110.camel@redhat.com>
Subject: Re: [RESEND PATCH v13 2/3] sched: Move task_mm_cid_work to mm
 work_struct
From: Gabriele Monaco <gmonaco@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kernel test robot
	 <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, aubrey.li@linux.intel.com,
 yu.c.chen@intel.com,  Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,  Peter
 Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Ingo Molnar <mingo@redhat.org>
Date: Wed, 02 Jul 2025 15:58:28 +0200
In-Reply-To: <26df8965-a430-4be3-a523-d292905f32fa@efficios.com>
References: <202506251555.de6720f7-lkp@intel.com>
	 <26df8965-a430-4be3-a523-d292905f32fa@efficios.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Wed, 2025-06-25 at 09:57 -0400, Mathieu Desnoyers wrote:
> On 2025-06-25 04:01, kernel test robot wrote:
> >=20
> > Hello,
> >=20
> > kernel test robot noticed a 10.1% regression of
> > hackbench.throughput on:
>=20
> Hi Gabriele,
>=20
> This is a significant regression. Can you investigate before it gets
> merged ?
>=20

Hi Mathieu,

I run some tests, the culprit for this performance regression seems to
be the interference due to more consistent `mm_cid` scans and them
running in `work_struct`, which brings some more scheduling overhead.

One solution could be to reduce the frequency: now they run
(sporadically) about every 100ms, if the minimum delay is 1s, the test
results seem ok.

However, I tried another approach that seems promising: work_struct get
scheduled relatively fast and this ends up giving a lot of contention
with kworkers, however something like timer_list seems less aggressive
and we obtain a similar reliability with respect to calls to the mm_cid
scan, without the same performance impact.

At the moment I just kept roughly the same structure of the patch and
used a timer delayed by 1 jiffy in place of the work_struct.
It may look cleaner if we use the timer directly for the 100ms delay
instead of storing and checking the time, in fact running a scan about
100ms after every rseq_handle_notify_resume.

What do you think?

Thanks,
Gabriele

