Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328EF13B58B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750630862; cv=none; b=oAETRjxN8h2VXLGE0TwTj1Ig50hQfibghvwnUv/Guvgk+DxTNlfUgrLv5uZwqtStq+DBC7+3F8N5Ccw3KlZgZywLdQnDscNmsQu8GVLdd3zVv/Pryl1yfGQHonNZmn4yVRZl+Rc7+9dHD9KZyTnBwmEPnGvOuFCEHUwppyRrj/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750630862; c=relaxed/simple;
	bh=8XCR60SH+v4sWnWGqIp5CksejMMLCEJp0rigbKv81wc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EFf/icI4FON4FLoFQKfHzYa3bH4b6kDlhK7FdW9vY4IIJt77aF0U2pfKnKCIspZJ/ndFqzD8oZyPrkqVC2cfN6vspMhE6nC/vRUnbmZOm1CwdQAjXpSYHEyKBJISVIARBH7rcEQ/k58uAHps3q1HeO99uP1L5zlypLoQ4LmgJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+zJjSXa; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+zJjSXa"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3505217e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750630858; x=1751235658; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oqIPVd+FEdkrP+g00Leqvb2fsE/UacCQhH7V6RQBXys=;
        b=B+zJjSXaPI/D69ECHoF+lNCH8ZGerqRkPXU1YJBLW+2t7biAuYIbv5KHdWkQ9stE/Q
         vRcpxOix3G1Ij7Dicz8Btr+GptXMH/4v0yiMUitK1J5KlJDMaw2GIABuVtJloW5uX31P
         HEli75m+Scvfbkz9EtJUkV9EahJprWFvN0K6hpyCWCW3ztziq+M1h/2Ga5wH1ZJdRpf8
         CoxBbOdZ8RWtenOHQwFY+jdMfqKAwm16+kwuPgNR8FW0XuDOvK/e6HpGIUMZvLs/lk+y
         FaNFB+ihWS3Ay801Ay7XCWIIH3jnh0nhYa8GhbJT/MIkYzaZFrBGXyMzZ9gK3CdoyxiT
         /TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750630858; x=1751235658;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqIPVd+FEdkrP+g00Leqvb2fsE/UacCQhH7V6RQBXys=;
        b=SKpdsbT855gTyoePaYMviyvYISnjFbdZ4IhfPi1Wu/79MRT2IaOmKKOEwwDGlnIsbv
         fM64kN/eTI8iiI5W19WgAB4rIaHleXU6yqTxeinX2zfnAbDSzTZ5Pnwe4MheGqTQIFp1
         /zT/tpYl1rDeDq71UpZkvPbSaC3VSQKSP4MMMG6Pc6WZaezykoifGjX4WE+2IXPP2LVi
         nh2Rqlki8uJ3ccACZlz4JUon/jHpEKj5xl45GPDY4iazTo7WJJ0YGiuK3JWPwsLw6czr
         ZvqfiPjbYp2Di24RmPRR8Z0wJXi34l/Tc/TBk5Z8HBZyt1xqtiagkNlWrVl1ApLKz0AX
         S93Q==
X-Gm-Message-State: AOJu0Yx32tcFZJZY/DkSa5IfP6Sa0xi7Dy8U6O/6WFkKZGVnG1jKCg4X
	JArUQ35E+XAxsRn7XTCQu8yagfX9sDnEfa0AvLWlgxcvVJMfc7Dj710vZpUYfNrni4mRIozqGrB
	0kwqR9lJ4GfESxt3Mw4k6sEpOsEDavW5If+f+ZvE=
X-Gm-Gg: ASbGncstEebErN9njoiN0llsuUqsli+TKLnKIOrxzLO2XXYIMB2XsvZUw95wbRKGzW6
	8IXMYU/SQ20uUC4sV2jDVqWWZrbwIaRjecwj/xH3EkdMboAs0NHftcSfbZzJJuSVC4fSfR92gBN
	ZDwMwC5nvq036ZUDZu92Q0jldGmOv1pZFRxIwNYsJPIBOGr3SpFQ/420JIRT61mkVV3tCq3vi+E
	u0i
X-Google-Smtp-Source: AGHT+IEaLOE3wktyetJVdRdecWtqPTlIy08utzhDC0WIzoic94lVLZ37+a7YbHb0PLSr0WUY6dVgmvPVCy4dpNFwOXg=
X-Received: by 2002:a05:6512:2214:b0:553:2c93:613d with SMTP id
 2adb3069b0e04-553e3b9a92cmr2662417e87.5.1750630857948; Sun, 22 Jun 2025
 15:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Arrsh Khusaria <arrshk01@gmail.com>
Date: Mon, 23 Jun 2025 03:50:24 +0530
X-Gm-Features: AX0GCFs0Wc4PM_Aj2A_jI5QBiDpCBQoanbeigTyiZv1d98Lfyiql1BL1j8qXS00
Message-ID: <CAC6rj2wiGOWUyhhGDRA-U8i=ZToorF4o6hwFeuC3RBDZ+rtoJQ@mail.gmail.com>
Subject: [PATCH] Fixed spacing errors in drivers/staging/fbtft/fbtft-bus.c
To: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006bdd8a06383082c9"

--0000000000006bdd8a06383082c9
Content-Type: multipart/alternative; boundary="0000000000006bdd8906383082c7"

--0000000000006bdd8906383082c7
Content-Type: text/plain; charset="UTF-8"

Hi,
This patch fixes spacing issues in drivers/staging/foo/foo.c,
such as spacing before parentheses and indentation, to comply with the
kernel coding style guidelines.

There are no functional changes.

This is my first kernel patch. Please let me know if anything needs to be
improved.

Thanks,
Arrsh

--0000000000006bdd8906383082c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>This patch fixes spacing issues in drivers/staging/=
foo/foo.c,<br>such as spacing before parentheses and indentation, to comply=
 with the<br>kernel coding style guidelines.<div><br>There are no functiona=
l changes.<br><br>This is my first kernel patch. Please let me know if anyt=
hing needs to be improved.<br><br>Thanks,<br>Arrsh<br></div></div>

--0000000000006bdd8906383082c7--
--0000000000006bdd8a06383082c9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-staging-fbtft-fix-spacing-issue-in-fbtft-bus.c.patch"
Content-Disposition: attachment; 
	filename="0001-staging-fbtft-fix-spacing-issue-in-fbtft-bus.c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mc88e01p0>
X-Attachment-Id: f_mc88e01p0

RnJvbSBkNTUzZjUzNTNmNjU1MjRlZDc1ZDE2ZmZmNzU3YWFmNmYwZDVlZWY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcnJzaCBLaHVzYXJpYSA8YXJyc2hrMDFAZ21haWwuY29tPgpE
YXRlOiBNb24sIDIzIEp1biAyMDI1IDAyOjA3OjE0ICswNTMwClN1YmplY3Q6IFtQQVRDSF0gc3Rh
Z2luZzogZmJ0ZnQ6IGZpeCBzcGFjaW5nIGlzc3VlIGluIGZidGZ0LWJ1cy5jCgpSZW1vdmVkIHVu
bmVjZXNzYXJ5IHdoaXRlc3BhY2UgYW5kIHRyYWlsaW5nIGNvbW1hIGluc2lkZSBhIGZ1bmN0aW9u
CnBhcmFtZXRlciBsaXN0LCBhcyByZXBvcnRlZCBieSBjaGVja3BhdGNoLnBsLiBObyBmdW5jdGlv
bmFsIGNoYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBBcnJzaCBLaHVzYXJpYSA8YXJyc2hrMDFAZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1idXMuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMgYi9kcml2ZXJzL3N0YWdpbmcv
ZmJ0ZnQvZmJ0ZnQtYnVzLmMKaW5kZXggMzBlNDM2ZmYxOWU0Li40MDk3NzA4OTFjNTQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1idXMuYworKysgYi9kcml2ZXJzL3N0
YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMKQEAgLTYyLDkgKzYyLDkgQEAgb3V0OgkJCQkJCQkJCSAg
ICAgIFwKIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIEVYUE9SVF9TWU1CT0woZnVuYyk7CiAKLWRl
ZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVfcmVnOF9idXM4LCB1OCwgdTgsICkKK2Rl
ZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVfcmVnOF9idXM4LCB1OCwgdTgpCiBkZWZp
bmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0X3dyaXRlX3JlZzE2X2J1czgsIF9fYmUxNiwgdTE2LCBj
cHVfdG9fYmUxNikKLWRlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVfcmVnMTZfYnVz
MTYsIHUxNiwgdTE2LCApCitkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0X3dyaXRlX3JlZzE2
X2J1czE2LCB1MTYsIHUxNikKIAogdm9pZCBmYnRmdF93cml0ZV9yZWc4X2J1czkoc3RydWN0IGZi
dGZ0X3BhciAqcGFyLCBpbnQgbGVuLCAuLi4pCiB7Ci0tIAoyLjUwLjAKCg==
--0000000000006bdd8a06383082c9--
