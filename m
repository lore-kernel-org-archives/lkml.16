Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DA1AC884
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274912; cv=none; b=VuU/m3J+TP4WnAFINodAB4L0yOFERVuRqqjICr7xIKTFwRwp6p2P4be/2t2yvQyL6Gzhvx77OplsDg3udSzhFOJWVFjHzB3fFjDlktizNIxi81Hc2/Ny3Jb4q/UHTFRjE+Bbs3jcMO3LHZnY8IByJhKazF3Y+sa3r4H5l8SepzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274912; c=relaxed/simple;
	bh=qMivFzsZbVkoKmSgRBnwcj8ZoYlhvu0cmK9Q7qy3cUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LERY5W+NsxhTWop8y14oTpVoQOuFFzC8TbjIa3xHxr+IVkJVQp797HS2DgcpMcCcs97cqsTNQ7NN64qtn1lxISK9LWPwSRMp/WLU/0lmHgjRUZ+NvbRgTy9GTqVMtUveoJ43LCjc6pjBlwerc7uQdRNjeCkw44dMXYKU3YTHYb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eNuh1xpM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eNuh1xpM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so1536384a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738274909; x=1738879709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMivFzsZbVkoKmSgRBnwcj8ZoYlhvu0cmK9Q7qy3cUA=;
        b=eNuh1xpMvqAtdNrCeBkE6YH1BjfJ9JNfp1AFs4rbQTOPGPWQwRtHwtb4Jpzg/wnlcW
         W/AHfYb6bBGmQEOFD0pBuAPMVVPF7RhUpW6FRLNgu5E9o3F+UXa6FfoDQ0Wc+dOS2765
         Qc6HM3U6jAG85L8AIfH8Gmu7gepQpvBmY/kHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274909; x=1738879709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMivFzsZbVkoKmSgRBnwcj8ZoYlhvu0cmK9Q7qy3cUA=;
        b=ADOAjPsxPbndzfDnDMgdog6KBmluacwsrvSlnEod5HvLluhMUdMcOx/NspNKVSu9PR
         JIfbIOqXT1jxFzzCB1UMvqbpO7D7HzlEMlf7twx0kXPkAGXW53O9joJfrkNOOWRPLxqi
         xQnQkOjHdJ5tgUtB+zdsPvH8R+HgBqoYzPRXNRE4FXGFe9JE2F9Fp6IHccYRyYUV8t65
         uwmfIHAsTQhRIrenBNc9AQbdIgBQWgg48ZDbJ7FssqkpMLit5pIRAna1YMMXjW5qi2gG
         /ZZ7l4rBI4gv7AeUkHdF82UvaB9vXXs8ccBmPsMdyKgygcl64QKbcJ1NeFN1fNokBc7J
         8+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVa+GB15bw3bXFSLV51k0fn3OLugMZDpg11PjVBF8vC0VTzhOZmeypdWSgUUiBgdvzZS+GrkOhwf0GDN9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ+99mXqot4Qc9rTwQzFQjz27eYwTDQfav8blRLlHuxJEocEyg
	mQUXoSqxjL/uGjolY84SbH8oGUVUCTtjc8KifIlllhU/gqOVK5AgNoakbC3wxEftDImJPtXhepX
	8HDGUxWMvJSdCySVPKq/ZQMnW0jV9vSTZbpIk
X-Gm-Gg: ASbGncvoSa1Lo+cHhdjUAt5LHZA0QhSNGJiX6K3RzIGAhs9X8c3ncp8m4FhWayhJEUU
	joYBppOOyNbn3e8+88m3F+cz3h9AbLgFQyLlBifPWAZLQgNRegGUTLHVPspo7t+zeD1LThdKceg
	==
X-Google-Smtp-Source: AGHT+IGrldTrNZ/8c9oljwo8V8v/OfXDxUYZgCi9ZOQfkkQ0USnqsaihfnBuyvdb31AwbQWf8XI6HE6g81DRomBomuY=
X-Received: by 2002:a17:907:94cd:b0:ab6:3633:13e with SMTP id
 a640c23a62f3a-ab6cfdbd071mr1038802366b.41.1738274909232; Thu, 30 Jan 2025
 14:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
 <20250130-kona-gpio-fixes-v1-3-dd61e0c0a9e7@gmail.com> <5fe49a62-b40d-480f-aee1-224e17db9f02@broadcom.com>
In-Reply-To: <5fe49a62-b40d-480f-aee1-224e17db9f02@broadcom.com>
From: Markus Mayer <markus.mayer@broadcom.com>
Date: Thu, 30 Jan 2025 14:08:16 -0800
X-Gm-Features: AWEUYZkbCoPpeT38Ui9RvO4h30F7SEA-SB0kYSU2MnOybjnditaCJPOPj-LMgKM
Message-ID: <CAGt4E5syrqpPs7=euvU5xJAsjb58Cp4+oOc_erfhpuuLcLy_gw@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: bcm-kona: Add missing newline to dev_err format string
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Artur Weber <aweber.kernel@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <markus.mayer@linaro.org>, 
	Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000081dfa1062cf3aa1a"

--00000000000081dfa1062cf3aa1a
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 10:41, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 1/30/25 09:10, Artur Weber wrote:
> > Add a missing newline to the format string of the "Couldn't get IRQ
> > for bank..." error message.
> >
> > Fixes: 757651e3d60e ("gpio: bcm281xx: Add GPIO driver")
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Markus Mayer <mmayer@broadcom.com>

--00000000000081dfa1062cf3aa1a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Ec/cP+EhLb6iWo+xOyG5tQ5x6rHF/myv8D6KjCGPNA244wCq//YJpACZxW/EmFhKpSMtJiOK3y6K
J6mUZis5jzWGejheX/GcA6ZPj1cg5HiVZ7jtolAr16MCAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZbWFya3VzLm1heWVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUpTl9ZDXeYdmvmTJ/9G5fdl5b
VawwDQYJKoZIhvcNAQELBQADggEBAEU2+9J4vQL2/+vHKw3JI1Euy99lcSBuEH6mm1PKer5G4WUm
bYYQ4A8XEDIPRdaWE8E4wpvrQU3GUFtHA+YT99qbcqf8ttU2zZCQ17djBSxfPwf5LVy9dBmtBS+s
6EXfI524CvSPzUT0wlJIvMEWJW2T/lBW52QpDBdsLFVisRbMRBfSemhxXYPDPBNIru4ojg5BP1xo
f5USQusyoaAQGD/iGFhbsfaGChOJ7+MrfFFZqvHK9GWNFg5citmQzQvN6p2/IdgaR8mJRMIpvq1z
iJSmEbdepvACxpoFNicZvebbKDcUwP4gmmiqDqnk9jy8cYDL/MgucszvSNowyevsrKcxggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwPPzUoCioaoirhBIcw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIGRZETsGa3Ox2Jbto8k99n06Z5l5ddtj
cpuZnogISELPMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEz
MDIyMDgyOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQDE6SvTRd+ylmyqrYGtVLdi6hDuUdgisC9laCCaS1U0pYuSS9Xs
yGUB415NIy8VmDQhbP7kw4JkfRKYe2/C7fQ5TPcwEFjeW9flFmhU+xmlZoO8jqXGxKMQG0YN1w6H
d17b3J12LZj6sExGgPwQp56m2+4owOoDNCStUbN9G912kM0T0wZ7JZX+bLEnCUiBKnYtQVngFy6u
Nqz2K3CDmmnnKLRMNTyINZzse4rhUStwAB6DEMT2vpw34b3tEsJpCI6hs2AH7NyZpmeS2Dx1ah2m
MqiJ0kRXYkEXACvjHFJ7JqXThr+7a/7MbQNPhbPpCos5kG/OZ339LIxuGCNGm0bj
--00000000000081dfa1062cf3aa1a--
