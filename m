Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1C273D81
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364101; cv=none; b=rNikXrhURI/V2wTfyTCdY7Hr1dncdHYzX/HHew3wez0d49/ii2hUKg2CV3AnHKobaDXGjwNWzZC4H2z014qvwcSxVaIoaJ/Gw8px2EbAGWPIN+jS4SR8ChwkYLkrcJhieC7srEDECk/79/Ee7Bc6LDN2KYyhgC1bQUBBYSWuDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364101; c=relaxed/simple;
	bh=Mi1AEloK4FOgIp5PsdiFEhlUsQcP6bOwwbl2otpJ134=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HGpih7ehcdPdkweWtYfA4C7aSNqCkWp/x4EI1DvS6LGyj3ywo2X3TR3UoGU0d6Ob28sMo5jjUQTZx26Q3PuH9g0qaqv6DBWud4wi8eapbS/+UPyH14G/23vPHNY5Q0HFzk/eg3dJ32Y30aXPjPGzQkqHGnvmuMiAqo28oWdrxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elMpgcGH; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elMpgcGH"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e8600a33792so2171079276.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364095; x=1751968895; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mi1AEloK4FOgIp5PsdiFEhlUsQcP6bOwwbl2otpJ134=;
        b=elMpgcGHgDCZrOeoIHDV8eNqgRtsvr5s0YmtsD7JgqIXC+9zxAEfhxAH2sxfig9J5G
         t5gJvPJQVfvdA9RxczuTBRFWOrdmQ3PrUQ6pm85aokqHuQZjHEHcK7kE0IkZIIGddFdG
         sTcYQu7aQLXuNOY9J0RBrgeaUBQtiHgkwrZqaQbEJIs/jzYylSykykPl9yu3oDfXzDc2
         MzMsHDhoEoLxSmx+uh+CD7qSwCUqytI7BP2OABcoQlVNeoQqzHmFmXEvkKW8k3c26Mje
         D4YZ9tTxdVNCZMAgQQo73PPMx43HpV8UIE10W2msr87O03DKSafD6ig8439VtMwC8npu
         xoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364095; x=1751968895;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi1AEloK4FOgIp5PsdiFEhlUsQcP6bOwwbl2otpJ134=;
        b=nqbGQtjArlciMNbAe3988qmNlODNqMT0/pqVxd6z6kPIyteOD648H2c39i2BJNXUu1
         QWctWUIXwSIiiddem6TGts5PjapT0tgmqy+Jx8AX1/Ys5DANofW7aTwMCWOXY2n2a2h3
         MfC/LP/wujgu8hHBAjWE01ozEl92vQX9Hi57GfezUKzB5FtuLhNTK2bqU4BUY7lTPaUC
         unrEvPXRDU9j1RkFxkS/ha3Ge3air9rT9okDXljI2DelTEs/MuS3xi8I3I/vEtrk6ZuE
         kQwNbsFzOdIwP/Sv6TPo0wgveqWG0239n9INMdtOYdjf7wiHsEjKvPrMD4zAQTzWL2Ss
         Bfyw==
X-Forwarded-Encrypted: i=1; AJvYcCXzTf/+dCtK/5Eb+kYbQmkEwz+234qS1CH7+xgRvfY59zvEv29l6obMYRVpcqSgwh6XKVU40N/qOPzrz9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAsMSxEltHL0GXZME+8TZOnXE48MnjQgpNoMDnDxJ2+lO9TX9
	XRk93SP46X1af1Kwmbt29XFZacdTWRIVG/PmPrTjxfkDU4JetAaMwi2TcN3N77iEfW8Q3j82S3Z
	hHQnBwzrgwEuKa5N2bWRFJPKdUi6IE5481C8j
X-Gm-Gg: ASbGncvNSThrdE0RdRAswypjzoupHviXx7Z8Gg3uc1myFbzoLNOIQNqrOkcVip++R+J
	eC4n5GBZLUp6SLsWNhXYXQLa+Fi/eHTbJrDA9NvAzB4T7SUdJ1L/v6OKMaNxNur+pUB9Qja1K1q
	Dk52a01oVT1DmAu/sr/l095we1D7oGo/ikgR4I8z2G/UI=
X-Google-Smtp-Source: AGHT+IGKSXsR04EFgOp8byn66gtuEnuLj+d4Wfl/Rsw1o64kyyqDOHjfiCeFlop+b9b0aQjhgHMA9QZymgJlE2s5p6o=
X-Received: by 2002:a05:6902:1a49:b0:e87:a878:3 with SMTP id
 3f1490d57ef6-e87a8780060mr20961158276.47.1751364094486; Tue, 01 Jul 2025
 03:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rafal Vonau <rafal.vonau@gmail.com>
Date: Tue, 1 Jul 2025 12:01:23 +0200
X-Gm-Features: Ac12FXyap6bqfEiC_lqZhRvzyo_EhWKcmv1Kt2i-8Acybgb2lT8USk1l6jg2iwA
Message-ID: <CABj3Bj_aM4sA1pLhSGpYPYzskW7raASHzWmtzjFq3s1ziWpHBw@mail.gmail.com>
Subject: [PATCH] mtd: rawnand: pl35x: Fix BBT write operations by adding pure
 data out pattern
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b99ce20638db3a41"

--000000000000b99ce20638db3a41
Content-Type: multipart/alternative; boundary="000000000000b99ce00638db3a3f"

--000000000000b99ce00638db3a3f
Content-Type: text/plain; charset="UTF-8"

The PL35x NAND controller driver was failing to write Bad Block Tables
due to missing support for pure data out operations. When the NAND
subsystem
attempted to write BBT data using just DATA_OUT commands without preceding
address cycles or commands, the operation parser failed to match any
pattern.

This patch:

Adds a dedicated execution function for pure data out operations

Includes a new pattern in the op parser for DATA_OUT only operation

The fix maintains proper separation of concerns where:

Command sequences are handled by nand_prog_page_begin_op/end_op

Data writing is handled by the controller's data out operation

BBT writes now complete successfully

Tested on Xilinx Zynq with Micron MT29F2G08ABBEAH4 NAND flash.

Signed-off-by: Rafal Vonau <rafal.vonau@gmail.com>

--000000000000b99ce00638db3a3f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><span style="font-family:monospace"><span style="color:rgb(0,0,0)">The PL35x NAND controller driver was failing to write Bad Block Tables
</span><br>due to missing support for pure data out operations. When the NAND subsystem
<br>attempted to write BBT data using just DATA_OUT commands without preceding
<br>address cycles or commands, the operation parser failed to match any pattern.
<br>
<br>This patch:
<br>
<br>Adds a dedicated execution function for pure data out operations
<br>
<br>Includes a new pattern in the op parser for DATA_OUT only operation
<br>
<br>The fix maintains proper separation of concerns where:
<br>
<br>Command sequences are handled by nand_prog_page_begin_op/end_op
<br>
<br>Data writing is handled by the controller&#39;s data out operation
<br>
<br>BBT writes now complete successfully
<br>
<br>Tested on Xilinx Zynq with Micron MT29F2G08ABBEAH4 NAND flash.
<br>
<br>Signed-off-by: Rafal Vonau &lt;<a href="mailto:rafal.vonau@gmail.com">rafal.vonau@gmail.com</a>&gt;<br>
<br></span></div>

--000000000000b99ce00638db3a3f--
--000000000000b99ce20638db3a41
Content-Type: text/x-patch; charset="US-ASCII"; name="zynq-pl35x-bbt-patch.patch"
Content-Disposition: attachment; filename="zynq-pl35x-bbt-patch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mckcydpf0>
X-Attachment-Id: f_mckcydpf0

ZGlmZiAtLWdpdCBhL2xpbnV4L2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJv
bGxlci5jIGIvbGludXgvZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVy
LmMKaW5kZXggMWQzZjAyNjFhNy4uYTJlOGJhOWRjNCAxMDA2NDQKLS0tIGEvbGludXgvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMKKysrIGIvbGludXgvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMKQEAgLTc1NSw2ICs3NTUsMzMg
QEAgc3RhdGljIGludCBwbDM1eF9uYW5kX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
IAlyZXR1cm4gMDsKIH0KIAorCitzdGF0aWMgaW50IHBsMzV4X25hbmRfZXhlY19kYXRhX291dF9v
cChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAorCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX3N1
Ym9wICpzdWJvcCkKK3sKKwlzdHJ1Y3QgcGwzNXhfbmFuZGMgKm5mYyA9IHRvX3BsMzV4X25hbmRj
KGNoaXAtPmNvbnRyb2xsZXIpOworCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0cjsK
Kwl1bnNpZ25lZCBpbnQgbGVuLCBvZmZzZXQ7CisKKwlpZiAoc3Vib3AtPm5pbnN0cnMgIT0gMSB8
fCBzdWJvcC0+aW5zdHJzWzBdLnR5cGUgIT0gTkFORF9PUF9EQVRBX09VVF9JTlNUUikgeworCQlk
ZXZfZXJyKG5mYy0+ZGV2LCAiSW52YWxpZCBkYXRhIG91dCBvcGVyYXRpb25cbiIpOworCQlyZXR1
cm4gLUVJTlZBTDsKKwl9CisKKwlpbnN0ciA9ICZzdWJvcC0+aW5zdHJzWzBdOworCW9mZnNldCA9
IG5hbmRfc3Vib3BfZ2V0X2RhdGFfc3RhcnRfb2ZmKHN1Ym9wLCAwKTsKKwlsZW4gPSBuYW5kX3N1
Ym9wX2dldF9kYXRhX2xlbihzdWJvcCwgMCk7CisKKwlkZXZfZGJnKG5mYy0+ZGV2LCAiRXhlY3V0
aW5nIGRhdGEgb3V0IG9wOiBsZW49JXUsIG9mZnNldD0ldVxuIiwgbGVuLCBvZmZzZXQpOworCisJ
cGwzNXhfbmFuZF93cml0ZV9kYXRhX29wKGNoaXAsIGluc3RyLT5jdHguZGF0YS5idWYub3V0ICsg
b2Zmc2V0LAorCQkJCSBsZW4sIGluc3RyLT5jdHguZGF0YS5mb3JjZV84Yml0LAorCQkJCSAwLCBQ
TDM1WF9TTUNfREFUQV9QSEFTRV9DTEVBUl9DUyk7CisKKwlyZXR1cm4gMDsKK30KKworCiBzdGF0
aWMgY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyIHBsMzV4X25hbmRjX29wX3BhcnNlciA9IE5B
TkRfT1BfUEFSU0VSKAogCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4ocGwzNXhfbmFuZF9leGVjX29w
LAogCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BBVF9DTURfRUxFTSh0cnVlKSwKQEAgLTc3NCw2
ICs4MDEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfb3BfcGFyc2VyIHBsMzV4X25hbmRj
X29wX3BhcnNlciA9IE5BTkRfT1BfUEFSU0VSKAogCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BB
VF9EQVRBX09VVF9FTEVNKGZhbHNlLCAyMTEyKSwKIAkJCSAgICAgICBOQU5EX09QX1BBUlNFUl9Q
QVRfQ01EX0VMRU0odHJ1ZSksCiAJCQkgICAgICAgTkFORF9PUF9QQVJTRVJfUEFUX1dBSVRSRFlf
RUxFTSh0cnVlKSksCisJLyogUHVyZSBkYXRhIG91dCBvcGVyYXRpb24gKGZvciBCQlQgd3JpdGVz
KSAqLworCU5BTkRfT1BfUEFSU0VSX1BBVFRFUk4ocGwzNXhfbmFuZF9leGVjX2RhdGFfb3V0X29w
LAorCQkJICAgICAgIE5BTkRfT1BfUEFSU0VSX1BBVF9EQVRBX09VVF9FTEVNKGZhbHNlLCAyMTEy
KSksCiAJKTsKIAo=
--000000000000b99ce20638db3a41--
