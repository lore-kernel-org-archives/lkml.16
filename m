Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0622231A2D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793803; cv=none; b=UR/tKCajq8pWnDUDTGqIf4zJxfUSHV2mNma7RGFFVWgN0Y0iywG66F5j9SGAGDA4xSYb5mttND8hwciiTyuyOk+RJpy3rivoys58B5DJXObPeUbv7+QODQPIPalMIesEdfM5/x7SUIdDgmorIJGfTyHf2LEdghbVoRVs5pKWGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793803; c=relaxed/simple;
	bh=q+FWIo5cQ2XMQv5SOsjmuvZf1xhMIdGuo1Ssz/xAWXw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AwZZl2S2XjRn0PQj86p8Bs8DFHiJusfq9KcFn66S0hDztc6JZCZQx0HVFv12zrfwyIsQpcqwwruUa3y2j5ab8CdHg3y/sknw7mkC/VfR68J6SKSPKXm1IwKEPqtrMOhNPIGTUHRsBCzu4d5JayrKNxO0c5OZPJBWIksk8A5oYj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QAOi2iIy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QAOi2iIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744793800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q+FWIo5cQ2XMQv5SOsjmuvZf1xhMIdGuo1Ssz/xAWXw=;
	b=QAOi2iIysExOYezbnC8Oh69Nx+3foPdKujs7FYqT1ix/VoTXK0WcakjbW3BOnDLXthprFG
	Lf+BBS2tvpbyXnN0HOG2HhIR8kLOzhopWNuBCiILBvxxj0XO/g4TkZOax6fu2c1NRgbFH3
	FnuX/8OXmCrF/Hshy7u3L2B7K6ymPeI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-4RtbBenOMqykvnI7catq-Q-1; Wed, 16 Apr 2025 04:56:25 -0400
X-MC-Unique: 4RtbBenOMqykvnI7catq-Q-1
X-Mimecast-MFC-AGG-ID: 4RtbBenOMqykvnI7catq-Q_1744793784
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so218907f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793784; x=1745398584;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+FWIo5cQ2XMQv5SOsjmuvZf1xhMIdGuo1Ssz/xAWXw=;
        b=Qwo5nq5HC/Kl2vOaemRB7yq1aCce0icVOx++FN251T8nd40hL3roHCNxnTeScOWwgW
         gHHlcm+XPMh0aDXwwV+0DwP8LVxDckroofFVuiJhrU8pZmWxbDPwH2jHIWWzQ6FWIYxg
         YEMJ6Ecc0/7OrWtHIJZ/IBnFC15ig2mDcJCAvl03XzfCKY1wg4exhN8FC3qLO1++ueZH
         6hS+eVKIucRQ9H6RIgz6wA30w5y6zopjzDNHq+S8v3ai1ErV0kHcAjAfK2jgQVr/dx7P
         u9ltnx4m2R8S3mehrfFoiw0fOLdgVzyHAeqWNgayJEcKxNjmvxw90+nR69R5BnzddfJK
         kiXw==
X-Forwarded-Encrypted: i=1; AJvYcCXMYcgy71UHeThMwzKoxOpxX5Htlg0x3RfVu8sl4OeyHYe7ly2cQt+V7Khq6ybiBuKIJ9//BhbdTV5VYks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0cD7UiTNT1n3JaZYEAVSwEGikZ4dgRfDr9a1OkiLkgLmH0Fa
	OdpfQoGTh9HQwo/IcP2BPGLNEbttMs/U5xTTCLG4+9GwfAZspSBohtT188kIs1QaQCMsTnv7r6k
	eviIEoC9JdAeh7GASt2c2hQz9OCXg6HrS12AHIgMZqxISIGSH3bw/8VbVpP9AMw==
X-Gm-Gg: ASbGncsfW77OHSrdTrttLeuAeayPGNhw2SYPks+AOaorhDF1MYYTZ0XsCeuygTTJNPu
	XxIvgCj5N5ux/hE2aOAPXunBlDIndGJjp4PPd141oja+mCh/jzK8G5MfDFsowRWiaDbN1jnWtVn
	rJOhzYOcHJyGYCpyo+OysOJL1FTTVOi9MJNj1bEtvGNj8yZfQKbtya140yug8ETmVnxyEz2lWdN
	SJsaS4LLClSiuC/nadrfSMUCNijNprC0atQiJH8w6bbpnQI1lQYfmCHxsM4ZnzpsnqiDNLA69jf
	oW8WGs6OX2Fl7XpiH2XDYadm0CnmRYRYoX38KFk=
X-Received: by 2002:a5d:5f82:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39ee5b11211mr1082763f8f.2.1744793783862;
        Wed, 16 Apr 2025 01:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL1qnnZyEc17y5GlPdSxW/6hCGr29jeLtRFM8D1Bd0LeBYgj2P+87yDlHJjQ0t2h0EmudnQw==
X-Received: by 2002:a5d:5f82:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39ee5b11211mr1082742f8f.2.1744793783543;
        Wed, 16 Apr 2025 01:56:23 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b590255sm14607635e9.28.2025.04.16.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:56:23 -0700 (PDT)
Message-ID: <db410a0036a7603262217a2e60a2fa14b1f1dcf4.camel@redhat.com>
Subject: Re: [PATCH v3 21/22] rv: Add documentation for rtapp monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Wed, 16 Apr 2025 10:56:21 +0200
In-Reply-To: <5236862a1dc65592caf0529922aa33c42b8aa3e8.1744785335.git.namcao@linutronix.de>
References: <cover.1744785335.git.namcao@linutronix.de>
	 <5236862a1dc65592caf0529922aa33c42b8aa3e8.1744785335.git.namcao@linutronix.de>
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

On Wed, 2025-04-16 at 08:51 +0200, Nam Cao wrote:
> Add documentation describing the rtapp monitor.
>=20
> Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0Documentation/trace/rv/monitor_rtapp.rst | 107
> +++++++++++++++++++++++
> =C2=A01 file changed, 107 insertions(+)
> =C2=A0create mode 100644 Documentation/trace/rv/monitor_rtapp.rst
>=20

Documentation/trace/rv/monitor_rtapp.rst: WARNING: document isn't
included in any toctree

You forgot adding this document to the index (and I forgot while
reviewing ;) )

Thanks,
Gabriele

