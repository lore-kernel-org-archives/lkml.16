Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1032135D1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344861; cv=none; b=p1nG79t22V7WIle+ZtMHLqW1IGAfJuY+hsuwjdN/s97h7OJLSSRg8B5y50RWZlp6yCFMcSv2hb3Ie+DXBJ/rFpHmYYDbqIKrzFluN7iz5PjQlJJjdFneADFaJZCq6b4M2N4ghsl8QqV5CuV9DNR5wBHr1DGAqkAbXV1THpNI91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344861; c=relaxed/simple;
	bh=Yjud2gsC/udD9jjF+b2Hy9hVLsm/XtorRylxoAoyLoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu0PZpIFqGySiFlxlFtJjeiMqCvr31A2l1yYk+cH9QBAVhsJd68ho480BrPqg5RxcAD+0FSCJONMpYRNmZgQxDO+K4WkthTThtKG0udJfBFhbMZ7xVlyFCjrVd4R8JjX7O7vNHx0Qb62p/xLTUkH3guUdcOp3QVTtQnx6+X++gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hdhlmx2N; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hdhlmx2N"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso125313266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750344857; x=1750949657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XfuLI84qxFgIslDrp0Ro+7uYJcV7a1LF2fuSwOV2nxI=;
        b=hdhlmx2NooJfmwvCDzP6T5VfSpvrZJvnJuLOPE8r81wiGXsGIDpmu5Y4EUgr1fBlbv
         GoBhvi9pQYBzyVibwnQKr+O3Xsh8cV/QZCzw8YxRswOLUplI29gpdgsdzuw10rkppzJv
         84Fk8hx9FUY3H+TNTHRu4BF1lZNpLS/AF51Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344857; x=1750949657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfuLI84qxFgIslDrp0Ro+7uYJcV7a1LF2fuSwOV2nxI=;
        b=pOqmJU3S6YM5u5fVHMpWlgePwhozdflQ3PepEe1wy9FE4E36crOpJPp1kZJObHjyyS
         ls+Qw5ssO1IKzJEveIYpTDokzqPeHXfGI3o/JSZXl3MQpJ5dMZiqd3qV/4qEm3DjvNn/
         OpiOkWl4C7ZoTZLh46KCaVy8bR+1QloxVMx9HEW4A8sD4Hw60bG+cToKuTW/+tyufKWh
         ZPR7e7EyAA1tmLn14XRNlIphSUJFxtAbpiN058OHdPlhPMbsYIDaoOW8pbfTzIeSzVa8
         Tnt0oHGJ5+cG7gApeZ14iLtOCF72sMpWvqSqsJSvCGynV1d9vAyh4j5/DGVnT0VXOfvp
         wLQg==
X-Forwarded-Encrypted: i=1; AJvYcCVA67s4H1nL272ZHXlxbSugjkEAWHhxW/xt3e7EAqHjH6iQrflxcBaZ48sdVe0Wce6RqcS6gWFLotW5yQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVsWB0Q4R1DZ/4moFL5rQtUcZOkQKcSxO/HlHO0NxpbaSSJ1uk
	i6lJ4ZiM/M3buCBmaCoueqTz8UHHxWrRWO318E7WdVQxGyf8vGVtbX9tsq9m4sVk5CS6H7gtgRV
	jSpheq8/5Yjn9TYQpQBb1aErWDAGR9IFbdb/PI+GD
X-Gm-Gg: ASbGncvmKBwjFxaURGpKGp9ojyEJVYUD2NXRAhy4LOuMXUpRBebT6UG9twL7sIS8zoB
	ChZ7eBuAym21eYjK/2UeKvUwXtDmUlKirCklBlRqFHykQh5RtZXt7349L3kuDcABiL+eq5nK3CS
	L4q2w/ggGapsqj1fR0ahhbOGNOze0bgAF3CjqpKw1F
X-Google-Smtp-Source: AGHT+IFfFs4MbDRxlYB+UY98UuB+6ncJCm1ixSmO2qPXLe0xgSYsJ0U+WR8zl9Rw7jareQ3ht4vGyGNxThxInxseGf8=
X-Received: by 2002:a17:907:96a4:b0:ade:3dc4:e67f with SMTP id
 a640c23a62f3a-adfad29b8b8mr1899671266b.9.1750344857487; Thu, 19 Jun 2025
 07:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614010344.636076-1-linux@treblig.org>
In-Reply-To: <20250614010344.636076-1-linux@treblig.org>
From: Geethu Joseph <geethu.joseph@broadcom.com>
Date: Thu, 19 Jun 2025 20:24:02 +0530
X-Gm-Features: Ac12FXxZnFbu6hsiz9WkKdiQ8pt_Tk9-XjWXTAxwzXn8819xNgB-9ApAEnjAv0E
Message-ID: <CANyZTduMVfvRUTMfhRN2HFkWQw5t7NGHKpet3iu2+Xc-vBdKfw@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmci deadcode
To: linux@treblig.org
Cc: bryan-bt.tan@broadcom.com, vishnu.dasa@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007d96850637edeb1b"

--0000000000007d96850637edeb1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 6:33=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Hi,
>   This is a set of deadcode removal in vmw_vmci; all of
> the removals are whole function removals for functions
> that were added in 2013 but haven't been used.
>
> Build tested only.
>
> Dave
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>

Acked-by Geethu Joseph <geethu.joseph@broadcom.com>

>
> Dr. David Alan Gilbert (3):
>   misc: vmw_vmci: Remove unused vmci_ctx functions
>   misc: vmw_vmci: Remove unused vmci_doorbell_notify
>   misc: vmw_vmci: Remove unused qpair functions
>
>  drivers/misc/vmw_vmci/vmci_context.c    |  54 ----------
>  drivers/misc/vmw_vmci/vmci_context.h    |   2 -
>  drivers/misc/vmw_vmci/vmci_doorbell.c   |  53 ----------
>  drivers/misc/vmw_vmci/vmci_queue_pair.c | 133 ------------------------
>  include/linux/vmw_vmci_api.h            |   7 --
>  5 files changed, 249 deletions(-)
>
> --
> 2.49.0
>

--0000000000007d96850637edeb1b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
zIBLqm+p9DyXSvZOIXA+mO4CqBu+PCDXGhH+5Jdl5JgWV8/hh3vGvuDQnO6rzGhrpOLDgEuSsVGX
85W67raMY4p0Ok1o5rnCtQmyBCHYbbAvCYUYqlT52L7Z16KB5nYOR3Th9YgQkBBu8eeyEXTOX7b7
zgi2M5FoqTbK77k0ePCxTmEIA0RGizEeGTzG3NylQwSYX05qWqI5U8fnNEvekXXK0Bvk0KHNJ1lx
H6yoCDFFmAXpuR6kvaXmMxA6KJnTx9CWLs54b13Bk7UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEaZ2VldGh1Lmpvc2VwaEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFMKoS5OPo2VVB0ZGCF1K
T6JfjO74MA0GCSqGSIb3DQEBCwUAA4ICAQBzkU+Cc99X3wioooiE9U1FMtJiooOfHjCW1DkDoDPr
19knE2RhXDTeK5mZPxoVtKWYL6u0OpTOiBfDEAvwxF9p9Iu/x0TpgFpSIe3mIbkSZ/4dbzvqn8t0
w11V2phihAQ90sgwGnw2M0vdi2jlRUyQcbqmiingFXHMgMLNms1qm58x2sJegi46zKLb9Ng9G/bU
9tPpRyjIVAZCw7sTQhXQ8Z3uYAp+OhzuPgCchO2N0bplUW0Wqc31PRbfGz61iazQKgXR2Yktyiwj
826urGPo5G4i5PzN1qEplUdMPS1hw+v2HocTLcQYjzjXVCC9+bI65T7+Fp2tDZcrvlQ6of9G4rRs
A/hsdXS0XokhTYLdXGNcrk8ltahBwlp875Hd8p2gUJO2cbrxl/ejKOZQGp1rIGxfJ20oXhXlhf8y
LL33dzAp3wCKgv+P/Q6oZGQDjTwcNgDS3O+N8JqawJnz3yrQgkkTJTIloGqFspJPhvGb24a9/N+4
T4RRyJ+VLTJnyqYDLSJhiWKUmyzLqIAtcQ+Ht7b+sjZMhlgbUL1DSR+qJUeahKfNP4kUBJbuo8sY
WxBYFsVpV/d761Qw2jvwFcWWxa7qRCmaINtaDncdCJthA/F3JOX/1Y6ITwoVGQrU9/UzvPJxJO1+
GDMu2ObDMipyUVfuP9S2/L/N4++WKAAoZjGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDDc1kJJOTNNraAHFrjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
Hop/xm2lUfrQ/HeUFI/9AZNFpOt+AUFeDm+bR/SwEGswGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUwNjE5MTQ1NDE3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAXsAbTDi6n7+/q8GFu4IV43vQiFn+aJM9G6aZ
MO3bibU2FVrwCgkJt6i+STGWRM2GKzNeQYpjJk0D6IKca/30E6C27Nc4/3vgTJUYXokLzXdLlPuN
9Nr5GxVBllzKuiYHqBaZ7+OP8fWfmuNenb+cyld9FOotTaGPAQVt+NxxwpUfIfmE2jXjjxp1I8X2
nEMw/YpXZF611dfRxV797s5xO+lIrCy1w/pTko5PB4aG2wegcajIdZODNpcbj+MjdUM5q+yyHZrS
1N8FZXNnPR6XFIyST2vOW/2RhphUJxecB1MmN17HXQcsqkZMtofr4+uH/Msqqaluqc8uUqVCJ44e
Qw==
--0000000000007d96850637edeb1b--
