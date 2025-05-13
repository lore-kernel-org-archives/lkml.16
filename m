Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D28F1E5B9C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115615; cv=none; b=nMRntJcX7w97OvqhJug2/SH7m6Luj7NN6vtQEN+XTlcyoHu22gxmMLCWMBvpAG2Evca0ocxnyCVBgxwtHI1Wd4nVer/6YRD6Z7grvCWsTFRPGAArmU7+GBbgjDzBMzdtRscKtugX/7Upe3g0vxvVmxyKToyKbrmcYwUxDr7RDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115615; c=relaxed/simple;
	bh=jB+1NSGMzo+MjMb56ZSc0FpCP8SLNObWRnq7yTjSBIg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r8SMF5LQof3n30mn3GBAv6xZvuNm9kgmJyQUBYwg/zORHpQBm86cwaD55N1BWUiX7Q38znSZaf3noM5GYSqbBFk2OxkkhaPDR5QibNaK9spe2oOdwXSWaZR8knybGTGryhgi8+qwz9wgJXOytvlovDSlrag9lYNuyEkjg15c30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnNLc/hc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnNLc/hc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2317d94c9cdso4220145ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747115613; x=1747720413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WNsyZBlrjZRlpcE1bXaf2I5YyPz0u8vhXL29PFihhZE=;
        b=XnNLc/hcT9dbeG/bkJGmRuXl9pN7gZCWY0Gtvn8UaqKk4B8zY7LD1S7UXv8/FsnVUg
         uwAg/+W4cWZLgfjyRvzvUblw76P1D6bsYtGQMhYZpvyPWtwo4QUV3VNfveUy1AXTjjas
         NVXqkkve/nmfdnafou9oDzPrzKINWviu9WpnR6BrCwFEIsDvehp31rv5g7h1AQbsVkEn
         hi/9uMqjN1KbKA0EplQLEqEEu6IWnC6cNYJmoUceoKrYFsXHMU36mc5RPtQou8odOB/7
         4gFEVJ7fYQ8u2bnYSwpbXMRoqTGCC8YWBL/l/d+83TRMedbgJHIhfxN06wG/UoLN3MYX
         JS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747115613; x=1747720413;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNsyZBlrjZRlpcE1bXaf2I5YyPz0u8vhXL29PFihhZE=;
        b=UIUhF/c3VqqhLxMqak8eCu7AIuM5BpY9N+M0lzTaAD2GUt5cKTIZbDfiBvdmLb66qU
         TzpEnO4CUa5Cljehlltt8nlRe9dlzTx1CL1Byw+BaYDcLpft6zDEHjZp0MJewKCn0Wo8
         VVUQ/jmdNpKsm+3ZuzGSptq3ywMVGBd93VVpaLnC5IqwigvksAmutrsZbz4q79Iv59FK
         JCGdjC8EQGKg0Y1w95JunIZwGaeX8VyXatP0jawOyqg9JubY/TPl4SIRRjjCrN2UtiZq
         6z09Ue6QABSl6KUP7Wr4ZTKD1eBmWOgWaeuwEmOWeFCpvLe2iS/bna1ChC3grFB4W0DS
         aYYg==
X-Forwarded-Encrypted: i=1; AJvYcCUau0byIDrSWx6h+X4iDNzF7yEqPR0ck6Z22/UFaf3LLLLF2OuBg+N/qO7y42wF2VZJS1NxFUaDHtNRkxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUf8OUmBiSiW0IwRarHQWG6TGhovyAJQJ8vq0yD39VbycQKmxQ
	08uSikVhBd13DC22+aECbBp8XJi+K/Pq6kU0zBJNNzVad0u9vSIjP05dDwA3YZrXFOTJRN9Pv2Q
	j0GsNkCI8p1kAAh+6XS4m7HUgDCZet5MyVQ0=
X-Gm-Gg: ASbGnct4OAX7+RXP6DRv0MUoNjGQ+UOgGqkY1Gm22H/OjvNQynGAnyIzvYKyXjYTSqN
	oBsadopd0ubHu1W9NXeCPbAbB0OD326AmSmB7BkOkG+IXPjW5Iqx4pxvjdXtaqicTAUOOGepP/+
	YDFdfPD67fm1PxNKO4Yrx38dvSIPj42dX7
X-Google-Smtp-Source: AGHT+IHOc8SXBuOLE9/iyqL8gXXnTqSTPtRR21+XgLdQcc71oLOwLLZ8JwQ7FB8OxioyLwjXMjTZMux/mq3GQJqBjCY=
X-Received: by 2002:a17:903:988:b0:220:c63b:d93c with SMTP id
 d9443c01a7336-22fc91aca1emr263133585ad.44.1747115613093; Mon, 12 May 2025
 22:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tanav Chinthapatla <tanavc01@gmail.com>
Date: Tue, 13 May 2025 01:53:20 -0400
X-Gm-Features: AX0GCFsHdIaazRy_QlZVSW3DrhT5qlEYmvBox6N8Eyt0rzr0kqKxYEMV0FvKf-0
Message-ID: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000808d9f0634fe0dbf"

--000000000000808d9f0634fe0dbf
Content-Type: multipart/alternative; boundary="000000000000808d9d0634fe0dbd"

--000000000000808d9d0634fe0dbd
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch fixes a checkpatch style issue in the rtl8723bs driver by
correcting spacing around a '+' operator.

The patch is attached to this email.

Thanks,
Tanav Chinthapatla

--000000000000808d9d0634fe0dbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>This patch fixes a checkpatch style=
 issue in the rtl8723bs driver by correcting spacing around a &#39;+&#39; o=
perator.=C2=A0</div><div><br></div><div>The patch is attached to this email=
.</div><div><br>Thanks,<br>Tanav Chinthapatla<br></div></div>

--000000000000808d9d0634fe0dbd--
--000000000000808d9f0634fe0dbf
Content-Type: application/octet-stream; 
	name="0001-staging-rtl8723bs-fix-spacing-around-in-rtw_cmd.c.patch"
Content-Disposition: attachment; 
	filename="0001-staging-rtl8723bs-fix-spacing-around-in-rtw_cmd.c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mam39x3s0>
X-Attachment-Id: f_mam39x3s0

RnJvbSAyNWFhMjRjN2NkZTdkZjU5MDE2NzRlYzA4MDkwOTkyYjE3YWZkNWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUYW5hdiBDaGludGhhcGF0bGEgPHRhbmF2YzAxQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCAxMyBNYXkgMjAyNSAwMDoxNjoyOSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IHN0YWdpbmc6IHJ0bDg3MjNiczogZml4IHNwYWNpbmcgYXJvdW5kICcrJyBpbiBydHdfY21kLmMK
ClNpZ25lZC1vZmYtYnk6IFRhbmF2IENoaW50aGFwYXRsYSA8dGFuYXZjMDFAZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfY21kLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X2NtZC5jIGIvZHJpdmVycy9zdGFnaW5n
L3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYwppbmRleCAxYzllOGIwMWQuLjk4ZDg5ZTgzNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYworKysgYi9k
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X2NtZC5jCkBAIC0xNjE5LDcgKzE2MTks
NyBAQCBzdGF0aWMgdm9pZCBydHdfYnRpbmZvX2hkbChzdHJ1Y3QgYWRhcHRlciAqYWRhcHRlciwg
dTggKmJ1ZiwgdTE2IGJ1Zl9sZW4pCiAJCWJ1ZlsxXSA9IDA7CiAJZWxzZSBpZiAoY21kX2lkeCA9
PSBCVElORk9fQlRfQVVUT19SUFQpCiAJCWJ1ZlsxXSA9IDI7Ci0JaGFsX2J0Y29leF9CdEluZm9O
b3RpZnkoYWRhcHRlciwgbGVuKzEsICZidWZbMV0pOworCWhhbF9idGNvZXhfQnRJbmZvTm90aWZ5
KGFkYXB0ZXIsIGxlbiArIDEsICZidWZbMV0pOwogfQogCiB1OCBydHdfYzJoX3BhY2tldF93a19j
bWQoc3RydWN0IGFkYXB0ZXIgKnBhZGFwdGVyLCB1OCAqcGJ1ZiwgdTE2IGxlbmd0aCkKLS0gCjIu
MzQuMQoK
--000000000000808d9f0634fe0dbf--
