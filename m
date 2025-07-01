Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491926C3A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364209; cv=none; b=cbgUZBYXfUrjQWoALtE2MR29oXZsVDe7YTgIGHp2YJttf2N+0DYUIstVUlOQZ9DeCBj9bYofQU1j7OdrQnG3AO2iF1jI29fi/0ERwtYDPvlTD8sjuArROU2uLuP2po0ECADgn/OztUDjvIfe9BLosquTn6SW9ODZbCbXkpfOexc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364209; c=relaxed/simple;
	bh=AnkkRH/j4DqHfbJbBUtADuCSzfFi54cjI3nCR73CTcs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=B4iK3cihEaDaxkCnjvWyRzHRLhBgjyz79/iChnIMCgGirEdq8B1ceHDZKDiwT6dbhFTuyuEEYNMLdG/0qxZkbP1M+G1W4ulRYTTktjItGxMqaDt9M+NdDM8k40jyLl8o1P9QWUc6XuOnREbLHLi8XYwT/XCeXijNf5EDjgCBXT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mh/OTh7R; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mh/OTh7R"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso4844600276.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364207; x=1751969007; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AnkkRH/j4DqHfbJbBUtADuCSzfFi54cjI3nCR73CTcs=;
        b=mh/OTh7R4JC+LH3XZluca+uCOPY5d3ke6lFRGf2v55PSuUPLaaQ+5Q4Tco3poWqidN
         nepDuDOM6Tso1LJoBhXeZ7PWEXJR1qaVsQCMlqxPC+C+EaF8sAkUOBR3hzfojCZLF11H
         kporOwBCfW0mqlNiQrcDZ9fDjla9gwjb0EWLgG5IP5N/svJAod7JuxH4WDrFG2voLP9m
         2IL5vhdp0uWlZFQGFUZSYQT0PBxxbOLwyqVQZEQZMdJCzEJEWMt6UAy+l5Qz39JThUVB
         z09GSEWBAIXH+0jLU6lFiG9mMJrFzlj46OmT6TJTqkVvxzmjUcCUaiUbWDbHbu6fUg4a
         dD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364207; x=1751969007;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnkkRH/j4DqHfbJbBUtADuCSzfFi54cjI3nCR73CTcs=;
        b=cK63Ig/ySF+MSM0A1mqh7jGaPqjEn6rfDdH63sf2f9DwnYPFz35kHhzUo5Y16UqczZ
         xZeQce/pfkshdTKAkY2CWgedwmFo65RX/ypIfSzXHH6UcDg+LgC7YY1cFeWWL6dYMiFi
         aFYvRW5mTIZ31aUUfnPgooFwHN01UeKM5l3iYFsoS0+4cY+iI+gE0IPfbFLCZB/2qyA5
         5yPAi+vL5oNPK+Py1xN+vrjWztN4aeR8telZAodZ2FKMkG+Zyd1nlrMV4aZnA/SDKgsq
         xqOI2WXUTkNSuYk9oftCcLH6dWstv9X7Uw4BBtiTeca6ddNx0GUZjWbEJFZO0veexqK6
         9aRg==
X-Forwarded-Encrypted: i=1; AJvYcCXsxHUYQCRFIXX+BflCJRLTthqIlmsPulJ/6wy9VEDE5Tx3E7Jrf1tTtrqwDZOpaXCH3J/8Tc3bz7Fl0nM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLxjbLRMy2mcn63rdYFe++uJbG5U541f/py/B0OEDW4xg6rY/
	ctAzyegefFmjYxqgGNBTDAhP+KFEoZK9iwVnoPQ9m81hOIGD27vNLWzQR+89jun66X0yAp4mrif
	tNX0lsWZj3Z1oMVbkteK13JjmA8+ccAY=
X-Gm-Gg: ASbGncs1vEa/dff04jP3GD3LmOAXz4rd1vkCXxeijI0mrPl4XSG9l679Nf4DOIm2ZVw
	IT2XmmRmQ5h49f/zOpYGDjhvlzXr0KzMuS5yDOJ6sQkQi2X25l0D7BLyJwap5ySoccwd6hvaHOd
	nV9lUpn8yMYBwG2isKuB4LvnTtEz/Bp9YKVF1ap5Hmd7o=
X-Google-Smtp-Source: AGHT+IGW8P/cNDeCm4GoxaDS0iPnLdis2313kcxhuwQM/dbVn5BoL0Y6NC3HvM9VRBpQFE7Ll211a71NpP7PGXKBUw0=
X-Received: by 2002:a05:6902:630e:b0:e7f:733e:5cc5 with SMTP id
 3f1490d57ef6-e87a7b6bacdmr15428164276.25.1751364207073; Tue, 01 Jul 2025
 03:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rafal Vonau <rafal.vonau@gmail.com>
Date: Tue, 1 Jul 2025 12:03:15 +0200
X-Gm-Features: Ac12FXxmIP5JcWZ5wOY11KHqPPnY__6XdG0AJLWpBsDRgm8er78I7JzVP46eifE
Message-ID: <CABj3Bj8-KVS2cvern77tPZGY9qHPnmwELkiMjAVYuB_X8zk0Wg@mail.gmail.com>
Subject: [PATCH] mtd: rawnand: pl35x: Fix BBT write operations by adding pure
 data out pattern
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000006f92ae0638db41b1"

--0000000000006f92ae0638db41b1
Content-Type: text/plain; charset="UTF-8"

The PL35x NAND controller driver was failing to write Bad Block Tables
due to missing support for pure data out operations. When the NAND subsystem
attempted to write BBT data using just DATA_OUT commands without preceding
address cycles or commands, the operation parser failed to match any pattern.

This patch:

Adds a dedicated execution function for pure data out operations

Includes a new pattern in the op parser for DATA_OUT only operation

The fix maintains proper separation of concerns where:

Command sequences are handled by nand_prog_page_begin_op/end_op

Data writing is handled by the controller's data out operation

BBT writes now complete successfully

Tested on Xilinx Zynq with Micron MT29F2G08ABBEAH4 NAND flash.

Signed-off-by: Rafal Vonau <rafal.vonau@gmail.com>

--0000000000006f92ae0638db41b1
Content-Type: text/x-patch; charset="US-ASCII"; name="zynq-pl35x-bbt-patch.patch"
Content-Disposition: attachment; filename="zynq-pl35x-bbt-patch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mckd0sdn0>
X-Attachment-Id: f_mckd0sdn0

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
--0000000000006f92ae0638db41b1--
