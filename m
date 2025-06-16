Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CC1E9B04
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750104605; cv=none; b=pYgPq2SKDfVoSFsUYaRtF4veF0lE+JAL2lV7dvfuxBgu29XfhqMYoXZMkYKNF4wV2WRpOKl/sQ0ije+GHEavGzbkKciLTSl53zwsd/QQx0js+fW15lfFBDkTfmliyfZa4wPGrVp/3OSLWrve8aDOodhy61UEnGkXTgvTXavuGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750104605; c=relaxed/simple;
	bh=oIMjuvvZJS/ozylwn8dCWfD40GJb6i512FwNqjyyPSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OjRmOH4fov7qthSEgaw4B8+uE5NIfGN+G37t0U3ZWov055h8qdrb1TV6rrzwdUoAtJVx+VfulM5lPPDqXLUvmSgimZ9WEwzGXQSotPcRGVrlzeUYtAjcv/42z+J7/kmNPiBE6wxTfjbEQf6cZSO/rQ+6PMrsa1LdGYLwRSmvB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XWYY49DK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XWYY49DK"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso10223057a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750104602; x=1750709402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uIc6Ni26SvRku+wqsRp55aCxTGftgBm9DUdaecqYqqs=;
        b=XWYY49DKobUOBv1MXVmlWXLtONe1+1+sAS3KHDkXT1eHkwYXNjnMVuiHM4jWMeBzf9
         a8QrhnWvU/g89/P35E6vWuyWc2iHCaV+QX53swsxNuHW2CZITLC3rmyh9zaYWfUElZzg
         GY2xdNJPqEAGXrmEsfMu7uRuFBxMLpfe9c0TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750104602; x=1750709402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIc6Ni26SvRku+wqsRp55aCxTGftgBm9DUdaecqYqqs=;
        b=Q67rguhFJ9IKaEsDp/JY3ajL1sxQCFaCl2ZgtHrWuyjvXys2GkP2uSUdQvTbdczqO9
         0bnKWuaXKv/XbcYZVEocV8fgP29Rbd22MGY+ESdS+GR7hokrY5yCn5Z2334El46Wf05V
         zsF25c+UJGGMjnjj74lSTs29vdRXJ8HuxYxYdtvRioAPHpo4tx5M/COHhLu17++x1dDG
         J2VW9CTNpqK9Jufd8ugwtIaw1Xl4u3N1Rwoleo9uFdgP5eQmIQcrH/pXxaQqRahPzqTt
         mByvA+P1714AJv/Yfms43bjypO/prRSJ8IVNQIWCveltUc29uh4kCe8VRy+t9YEtdenV
         7CyA==
X-Forwarded-Encrypted: i=1; AJvYcCXuwLF05mKUP0TuSHfkCImeuG3KdieO3J9pNB5XCs3tDsYzkUeemm8bY1UgXJDI2FF6zjwDlNPgAnPQtog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+VPasqoEC4lGShMd/fSq2hj2hGE2NWnSv/x3WNb6HmNYkBz3
	bAklo5ZLioPbyjiN18YDNrJ2nn3+2dZIk1CrLHxRAeFvhVkMnd61edy4MGDAw93Fco7sAOpO7HR
	uX0WCKqeR6Ok4GcrmuEAt9TDLubLhNob015epeOMQ
X-Gm-Gg: ASbGncvhF9BHXVzrjq26FzaRex7w5Rw4eMC/gldlCGtxQ7PtufcLjz93QfejeqeUd0X
	+6mF6Biou9nJ0hkdXTq2LuydPuWfbljb+/7pIpqsNgLnvvEh9aI1ZugSYQFcS4pHI94VXzb2OqT
	2oEJ7bsbG4tDfJ6MWhr3s0uasjrB8L7IxK6h2zw4/LK4fY
X-Google-Smtp-Source: AGHT+IGOpN0njBv7HEASEE8WkP30zGj4xYe1dssFvSYVOU+PBwmpNnereFWLz5Lh9+nnaU7YfnR42LWKU1zVfKaDAyE=
X-Received: by 2002:a17:907:1b15:b0:ade:316e:bfc with SMTP id
 a640c23a62f3a-adfad30de8emr1092662466b.21.1750104602466; Mon, 16 Jun 2025
 13:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615154051.1365631-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250615154051.1365631-1-alok.a.tiwari@oracle.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Mon, 16 Jun 2025 13:09:50 -0700
X-Gm-Features: AX0GCFs_sgc8dwrEkN6sL6bUsd2LNRaBntWz8g-BBTpF460lksH0a-rV6lfxqEE
Message-ID: <CACKFLinLr1W+8aLDaW+k7DVaeMLGVp-2S43Ku1GS7LkrtxDrdQ@mail.gmail.com>
Subject: Re: [PATCH] bnxt_en: Improve comment wording and error return code
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: netdev@vger.kernel.org, pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002b8ad10637b5fb7e"

--0000000000002b8ad10637b5fb7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 8:40=E2=80=AFAM Alok Tiwari <alok.a.tiwari@oracle.c=
om> wrote:
>
> Improved wording and grammar in several comments for clarity.
>   "the must belongs" -> "it must belong"
>   "mininum" -> "minimum"
>   "fileds" -> "fields"
>
> Replaced return -1 with -EINVAL in hwrm_ring_alloc_send_msg()
> to return a proper error code.
>
> These changes enhance code readability and consistent error handling.
>
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed for net-next.  Thanks.
Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--0000000000002b8ad10637b5fb7e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
OnaLEot1MoQO7BIe5S9H4AcCEXXcrJJiAtMCl47ARpyHmvQFQFFTrHgUYEd9V+9bOzY7MBIGSV1N
/JfsT1sZw6HT0lJkSQefhPGpBniAob62DJP3qr11tu8CAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU31rAyTdZweIF0tJTFYwfOv2w
L4QwDQYJKoZIhvcNAQELBQADggEBACcuyaGmk0NSZ7Kio7O7WSZ0j0f9xXcBnLbJvQXFYM7JI5uS
kw5ozATEN5gfmNIe0AHzqwoYjAf3x8Dv2w7HgyrxWdpjTKQFv5jojxa3A5LVuM8mhPGZfR/L5jSk
5xc3llsKqrWI4ov4JyW79p0E99gfPA6Waixoavxvv1CZBQ4Stu7N660kTu9sJrACf20E+hdKLoiU
hd5wiQXo9B2ncm5P3jFLYLBmPltIn/uzdiYpFj+E9kS9XYDd+boBZhN1Vh0296zLQZobLfKFzClo
E6IFyTTANonrXvCRgodKS+QJEH8Syu2jSKe023aVemkuZjzvPK7o9iU7BKkPG2pzLPgxggJgMIIC
XAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxeQGjDntHGb2iaQkIw
DQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEILoWz7GSo2sTyjeSAE/HYonfrZRaB8lB
RoGuSNiq8OHBMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDYx
NjIwMTAwMlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEB
AQUABIIBAEKTrdVNFr4DDoXvuva6oqQiq5F8o/ZaIr8TDoFPh9xIK1rVOgcQFkkvnKrTOF/Yo/+x
9CWVhD3sM/ELQPBjkkKr8wEA8lnUUrseXf6eGGZCPnJCDOB1aoXs/qKe/X3ZKcS6AWOpvy/FcExe
0kY8ujYkSwrchpBLnSh+wLs5knhoLbM3Lm/+7P8k3Nx8hPJgcHlw4VcNbT++/xGnpjxwnzhsNHIg
ZjVLtUoOrjFqEseOB9Vo31hXdUev09QUvZ9HsLrL5uIciyR9FjQugd7SA8uqYUmH6Jdu97ULFmar
qo72GXXHUrO3AnfQ10J1yZAsXXtJr4R4tW9QhONjXhaA2YI=
--0000000000002b8ad10637b5fb7e--
