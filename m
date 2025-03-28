Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FD720E024
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144225; cv=none; b=fTekshCBpb0I4rFIWJDXVemkabf2ceyeyeZLGMJfTdFkA0djYSAXz9Z8iLokGbxDAccFKJInTv95OAaWED1VT704Q8W4FcbOFfWbtsNTivDA6kygTMC2Olb/PJbQ3YQ/tL39iuUS7JqwkD8EA8zEmrh//vf3KdNgP5bhlorkTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144225; c=relaxed/simple;
	bh=QzEMo92VpPHmAaQtyX+5cfH/xVcztA0coQcyn4PqF/Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kQWOhj7g0hTpD/PgOSp5RWwuU6uqGcRs8VYcX9qNzHvW+IYg9xe4CqFny4dGYKVHRV7HVTay+SaAu/AnQxsv1m3sY+/sCMnWAjhNQuraaFkexXNb1TeT+CD5hIX5yxt6XbJx2KU29g7WnktSYG34YbP06yWnDYLwk1+80nHDsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C34diChs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C34diChs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743144221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QzEMo92VpPHmAaQtyX+5cfH/xVcztA0coQcyn4PqF/Q=;
	b=C34diChszlIlF3bWR+Asi9dmIFKnMkxP7d/ZHFZGc6/Lx2Lewxy9cDp5FRi+hVDJV6pGEG
	VHbPImNedY+23Vu0MN9ZOLWlAVFrAwk1KIx+sUK09N09feUjlo2R0I3bkPkHW0cMWTSQpb
	qhH/t483IxtoUJaUDJIvURKUk2c/inM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-jJr67BLOMmOL4CeTxxLkFw-1; Fri, 28 Mar 2025 02:43:39 -0400
X-MC-Unique: jJr67BLOMmOL4CeTxxLkFw-1
X-Mimecast-MFC-AGG-ID: jJr67BLOMmOL4CeTxxLkFw_1743144218
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so13626745e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743144218; x=1743749018;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzEMo92VpPHmAaQtyX+5cfH/xVcztA0coQcyn4PqF/Q=;
        b=v0AP+jvrwnyB6NlweLMiEZ+sRxVOYoO2oV/QvOkxYM1TvYIQlCQUR/WQ2tC6h4LxUj
         23rthwSrHSdv2g17R7PUk2WMdHc+xAQ7EFSo1qshxFZ22Tb7LDffoqhLDUXIEQzKfbXN
         i9hXYAH5xwtn1ZHYkUC82URjvTkijnJ2DSEoyhFQbr+pKbEZewUTC98XiEF3jaCGkzmT
         C9+l6AZ/LZXiL4Vt/HoCRFvyIVvfVoU6TpF3sKm2V/PxS2HgbPb1DswPSUKH/VKHG760
         t5XzhJv14kRs0s6lSTbvji2+hGghvqraLa8DHqrAp4z3tK8BZiPIFoMCGihoMvxvR2ox
         0Mvg==
X-Gm-Message-State: AOJu0Yzi4JbikkVJ8Bt92smBbJ7rg0eTHCMXvy7XnWpPU9NKkMQHLT8T
	mnSUrcaHitMpeqj4O/0ocftKfHEtgdPuaW4GwB7DWkkV8E+8i5f9H7vQwplE9JZJ4MRjN6sBHMu
	c+nL++Smr7RV3gnFclxyMmHMg1/4VCGZxAkEcFiS2na4U0mLZ4cqUs4kj7E9kvg==
X-Gm-Gg: ASbGncvrk35X/gYriMspqrw7KFngtiZqzI3TlJxFcsAMsYO5dqa787egytcYLd2rB+L
	4iWqRfIkkRQpUBSAi/5MT9z7inDbjrnRnReBm0FBZoMBgZwXSsZFgUj2E+eRqho+IHjr0ODvRXV
	XrgCmNyWWAr/Qdy39R7HmkFEkl/8M6lWE9w4qhfZAwqj7Woc0GmBv2/xPtGZtdvKZUpUrWwI0Pr
	zEZTIIYjguVgecl9T2EhZAXWAo4JSoyM3oTchlkQp4k/J/Yo02OVsiDN6M01S2F7bvQspskoubq
	IJD3eVRfe4d/UDkWVgWQ6gCdx8iKY4Fnf6m/Pgx6Lw==
X-Received: by 2002:a05:600c:1d05:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d84f5f482mr65637725e9.2.1743144218045;
        Thu, 27 Mar 2025 23:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3yKqouv0HvS32lLitiY6d86qe0yVhRS+yMn7D0is1F0NoGuEmOmYStxhmTg94verH6/GLg==
X-Received: by 2002:a05:600c:1d05:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d84f5f482mr65637505e9.2.1743144217663;
        Thu, 27 Mar 2025 23:43:37 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff02f9csm17826775e9.26.2025.03.27.23.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 23:43:37 -0700 (PDT)
Message-ID: <02115faaef1d9646a79a1be538bca83a4cb042b6.camel@redhat.com>
Subject: Re: [for-next][PATCH] Documentation/rv: Add sched pages to the
 indices
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Tomas Glozar <tglozar@redhat.com>, 
 John Kacur <jkacur@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Stephen
 Rothwell <sfr@canb.auug.org.au>
Date: Fri, 28 Mar 2025 07:43:35 +0100
In-Reply-To: <20250327120631.61c974f7@gandalf.local.home>
References: <20250327120631.61c974f7@gandalf.local.home>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

2025-03-27T16:14:10Z Steven Rostedt <rostedt@goodmis.org>:

>=20
> =C2=A0 git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.gi=
t
> latency/for-next
>=20
> Head SHA1: 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b
>=20
>=20
> Gabriele Monaco (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Documentation/rv: Add sched pages to the i=
ndices
>=20
> ----
> Documentation/tools/rv/index.rst | 1 +
> Documentation/trace/rv/index.rst | 1 +
> 2 files changed, 2 insertions(+)
> ---------------------------

Hi Steve,

this last patch didn't make it to the trace-latency-v6.15-2 tag and was
not picked by the pull request during merge.
Is it something that the next round of automation will do?

Thanks,
Gabriele


