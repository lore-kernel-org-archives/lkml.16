Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59B6239E77
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361981; cv=none; b=Pm57AsAxwkHbXyrqCJBqrdx8hWsHfd6PKVSrt7HsoLnK/ebTNQG0ZQxOCmSwhbVBaslNAcbGqLcGHtMD5gCq3DH5RBv4jHUakH4jkY0J3x/z6jrFEvXx3EEX9w8t505bRbAMNYRpFDX5Lq1lJSbKP+4kTasFBjMMpNABXd9o2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361981; c=relaxed/simple;
	bh=b3E5PyKAcXeZDA12BYvEIlGAVmvRJU5sMlRNNzj40jw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=YQQUUkdJ0A56rALa+3uc4PI8mSKx+50QwQldPpxSKeTeCv693XVpw1J1NPXvUvkYyg1cM8zStAvr+KIT7O+d/akhzIYbHumOB2e8C9OcHDfN1J8nRSJdOo+XqUJ9iTrXgTOqp//VByrB7jVmQGHa+wFvvkG+rsZISbIWz5mSCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DldP4Ldq; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DldP4Ldq"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e82314f9a51so3459807276.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361979; x=1751966779; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EupNRo0trcAWCs6vsdgAY86X+dOc2p/qAaWvLgfZk/s=;
        b=DldP4LdqhArBJq+WHU8H7NzJHxP8ADLBC6ESzU90u5SeKrWJ+eCOWmgArY4oPeyqh0
         Qlnat5/9RsoHvO+Lg91F3clWyZCbQAWys00bdQc2GHKIJWnF78f4OVA/XQ3XoGlS3Kt/
         ZJHAKojMeHUQ9MBTAvlVZce6NmlDxRW68Ld6SR7SJpTuwiHJo9PXKy3KTyaFxq7yBUzL
         RuXfNiqjlGLX/J5Jk7Ew1RVo5ASj0P1O43DrQGfa33g+z4RLifwtcM4HJKMv+2u0asHK
         rC5mkeoaWHzb/EyoQn20az4N7CE75gqkSu3JJ1eJi/CxnCx7Jp8GLBogDmDyDAl8Uqtz
         MBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361979; x=1751966779;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EupNRo0trcAWCs6vsdgAY86X+dOc2p/qAaWvLgfZk/s=;
        b=gVieGlaQe6/7AVlj3htnqwYOdcO70NO4JQeNIjh93mMcotGJ3BsPzawtr8h9Cfinkr
         w+EVvsVrO6Vt4Lj5ntjTqDX1Nb7n4Mw3Z5eVW1D29yn2/1wLvJaPYDoAmAlNlb81M/cN
         CYxHkqTG+vXAYvyxCIYye0dFjKMC8sBC4LjA6u0AC56zHWnk6RBxx5NihuwdGa8rt2Nf
         BY8aS+OHqKXWKXPDAL6Og/wzT9BFPZ2airxwfpaixdU4wiE2rIpTXQSIshNQWFICbPIS
         odS5AWek+R9cUzxDqtFazlKHDs1XyP/Bftff3rHCr0RyvuAXHCzmGJEkCz4UpZG7rAHB
         jM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUxysB9seq46YrsemH5deFCMWwxORCRtTaVQJDepABxht9F2yJud8O28Z25hsRw3XwHOcJ/j7zt/oUFIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+ULFCqxNE4uRRxTlMLcbm52H6o0kAhVbnx7I1ICXUwSbuecV
	IGwWoVEyMMYKFuWxPHQNBn9hPtVYc2Hi59Nsob4H9zqCKiQVh8FDv8bclPygDepxgV4kqGbQPnw
	sBvRFHjsxodyGWIhzTsnXL+55cLhcXufQzf1/
X-Gm-Gg: ASbGncu97MB8Mr5L6DIvo4FZmwBTzsww+gh+nHCZ2Z4YXvY/B1OgnUzdQ8EsxWxeGab
	NFqzf22XxfgAIDirCwnwqAQYsJ8uTMfsOv7aPT5LeRq6pCYBVB7RgRMTmcOrCpfI4fZ2+AqakLC
	Gu7n/16YGtfX2w/DtdwBE4TAEkoBBe6GMZ3X9jICUmS3s=
X-Google-Smtp-Source: AGHT+IF4Gr5KmCtnNo0LWfUDfT4PLnfH5wUHYdqYph8uEg2+kXZAnwFxZJFSHUoBF7jawFVvXvjmCRHumDcw0lrxr9I=
X-Received: by 2002:a05:6902:298b:b0:e82:5dca:92fc with SMTP id
 3f1490d57ef6-e87a7b25998mr15426132276.21.1751361978537; Tue, 01 Jul 2025
 02:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rafal Vonau <rafal.vonau@gmail.com>
Date: Tue, 1 Jul 2025 11:26:07 +0200
X-Gm-Features: Ac12FXyHbvy0yXh3GMk5OClAO7Zffy5s-SYihUM60J1EHRus-36CxjfnrlQln1A
Message-ID: <CABj3Bj_gak3B6VNX0e22VBhYwinUK3f76hgZ-Kk0wgRVs=nVpQ@mail.gmail.com>
Subject: [PATCH] mtd: rawnand: pl35x: Fix BBT write operations by adding pure
 data out pattern
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000009acf660638dabcf1"

--0000000000009acf660638dabcf1
Content-Type: multipart/alternative; boundary="0000000000009acf640638dabcef"

--0000000000009acf640638dabcef
Content-Type: text/plain; charset="UTF-8"

The PL35x NAND controller driver was failing to write Bad Block Tables
due to missing support for pure data out operations. When the NAND subsystem
attempted to write BBT data using just DATA_OUT commands without preceding
address cycles or commands, the operation parser failed to match any
pattern.

This patch:

   1.

   Adds a dedicated execution function for pure data out operations
   2.

   Includes a new pattern in the op parser for DATA_OUT only operation

The fix maintains proper separation of concerns where:

   -

   Command sequences are handled by nand_prog_page_begin_op/end_op
   -

   Data writing is handled by the controller's data out operation
   -

   BBT writes now complete successfully

Tested on Xilinx Zynq with Micron MT29F2G08ABBEAH4 NAND flash.

Signed-off-by: Rafal Vonau <r <https://mailto:your.email@example.com/>
afal.vonau@gmail.com>

--0000000000009acf640638dabcef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-ds-markdown-paragraph" style=3D"font-siz=
e:16.002px;color:rgb(64,64,64);font-family:quote-cjk-patch,Inter,system-ui,=
-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,&quot;Noto San=
s&quot;,Ubuntu,Cantarell,&quot;Helvetica Neue&quot;,Oxygen,&quot;Open Sans&=
quot;,sans-serif">The PL35x NAND controller driver was failing to write Bad=
 Block Tables<br>due to missing support for pure data out operations. When =
the NAND subsystem<br>attempted to write BBT data using just DATA_OUT comma=
nds without preceding<br>address cycles or commands, the operation parser f=
ailed to match any pattern.</p><p class=3D"gmail-ds-markdown-paragraph" sty=
le=3D"font-size:16.002px;color:rgb(64,64,64);font-family:quote-cjk-patch,In=
ter,system-ui,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,=
&quot;Noto Sans&quot;,Ubuntu,Cantarell,&quot;Helvetica Neue&quot;,Oxygen,&q=
uot;Open Sans&quot;,sans-serif">This patch:</p><ol start=3D"1" style=3D"col=
or:rgb(64,64,64);font-family:quote-cjk-patch,Inter,system-ui,-apple-system,=
BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,&quot;Noto Sans&quot;,Ubuntu=
,Cantarell,&quot;Helvetica Neue&quot;,Oxygen,&quot;Open Sans&quot;,sans-ser=
if;font-size:16.002px"><li><p class=3D"gmail-ds-markdown-paragraph" style=
=3D"margin:0px">Adds a dedicated execution function for pure data out opera=
tions</p></li><li style=3D"margin-top:4px"><p class=3D"gmail-ds-markdown-pa=
ragraph" style=3D"margin:0px">Includes a new pattern in the op parser for D=
ATA_OUT only operation</p></li></ol><p class=3D"gmail-ds-markdown-paragraph=
" style=3D"font-size:16.002px;color:rgb(64,64,64);font-family:quote-cjk-pat=
ch,Inter,system-ui,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Ro=
boto,&quot;Noto Sans&quot;,Ubuntu,Cantarell,&quot;Helvetica Neue&quot;,Oxyg=
en,&quot;Open Sans&quot;,sans-serif">The fix maintains proper separation of=
 concerns where:</p><ul style=3D"color:rgb(64,64,64);font-family:quote-cjk-=
patch,Inter,system-ui,-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;=
,Roboto,&quot;Noto Sans&quot;,Ubuntu,Cantarell,&quot;Helvetica Neue&quot;,O=
xygen,&quot;Open Sans&quot;,sans-serif;font-size:16.002px"><li><p class=3D"=
gmail-ds-markdown-paragraph" style=3D"margin:0px">Command sequences are han=
dled by nand_prog_page_begin_op/end_op</p></li><li style=3D"margin-top:4px"=
><p class=3D"gmail-ds-markdown-paragraph" style=3D"margin:0px">Data writing=
 is handled by the controller&#39;s data out operation</p></li><li style=3D=
"margin-top:4px"><p class=3D"gmail-ds-markdown-paragraph" style=3D"margin:0=
px">BBT writes now complete successfully</p></li></ul><p class=3D"gmail-ds-=
markdown-paragraph" style=3D"font-size:16.002px;color:rgb(64,64,64);font-fa=
mily:quote-cjk-patch,Inter,system-ui,-apple-system,BlinkMacSystemFont,&quot=
;Segoe UI&quot;,Roboto,&quot;Noto Sans&quot;,Ubuntu,Cantarell,&quot;Helveti=
ca Neue&quot;,Oxygen,&quot;Open Sans&quot;,sans-serif">Tested on Xilinx Zyn=
q with Micron MT29F2G08ABBEAH4 NAND flash.</p><p class=3D"gmail-ds-markdown=
-paragraph" style=3D"font-size:16.002px;color:rgb(64,64,64);font-family:quo=
te-cjk-patch,Inter,system-ui,-apple-system,BlinkMacSystemFont,&quot;Segoe U=
I&quot;,Roboto,&quot;Noto Sans&quot;,Ubuntu,Cantarell,&quot;Helvetica Neue&=
quot;,Oxygen,&quot;Open Sans&quot;,sans-serif">Signed-off-by: Rafal Vonau &=
lt;<a href=3D"https://mailto:your.email@example.com/" target=3D"_blank" rel=
=3D"noreferrer" style=3D"text-decoration-line:none">r</a><a href=3D"mailto:=
afal.vonau@gmail.com">afal.vonau@gmail.com</a>&gt;</p></div>

--0000000000009acf640638dabcef--
--0000000000009acf660638dabcf1
Content-Type: text/x-patch; charset="US-ASCII"; name="zynq-pl35x-bbt-patch.patch"
Content-Disposition: attachment; filename="zynq-pl35x-bbt-patch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mckboxlz0>
X-Attachment-Id: f_mckboxlz0

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
--0000000000009acf660638dabcf1--
