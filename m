Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5B27FD4F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399395; cv=none; b=ghS8ZzGPzfIwF9NuUQN+c8MIxjonTpGDJ352whe8/aBcZDJsWCKrTLpuBq8yYkgggiyU03ZUbRMgNrYcVs0L+iiZFdLKhTynry0GEDfCz+0HneDLzJIVoWcISwDUgHu418hn+J/DAW2Nm5YSirUm9gPGyYwfI13NtR6IoZEEYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399395; c=relaxed/simple;
	bh=4ouaXa6xzVQ0foONzNqaeF/YFMHR8wwhLNhhS7V1++k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tjc9Wd/hYxHI+KAx5UZrLzvH6SkoIoqHJ4bN8OVlMkhprN1UKmMIb5LLJEbqJUNgm0rXcW6Mxva7gEfHOceYXedgprkxH1BGjHJGgPJGsrQH0bisE5okFcatbVB12cuiICuWJtDRkid/ZzEysDJ646W5uQmfJH+UrScOkW8KAXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP9yxSMu; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP9yxSMu"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e5d953c0bso68005567b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399392; x=1752004192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4GaahoyBk8jDx9SFdqQfmfH84r/4wlicoROwaD8CIho=;
        b=YP9yxSMu/uKVGEOvyqfFLYXo7q12x+GB55hjlkrlGJcjzlf4OPzyAvdiJ1TL9Awjjm
         4nAkt3ddeOkhN37KGhPxwIM7h9xGyz8MdKPUcUudTA+GhxMZTczy/+hb40cMAjno6Dnb
         s20mENat2pt+tVfrJvKcAVZ//gFz4LMAdCnMA4/7z01zOMq7u8gmoE384DxOVV5nCQR+
         vkQxyKw6AaKx17bTcYrjvyEk3OtEQwjQH+yW/pyJ5KIOAoj5zZs+HuVB7vPu7Zlvc8yU
         KX1tjJH9dNkn5uwkaM3tjuuAC9mDkLSXg4TP+XmM5puWhUM01X/mla1JZWd07wLStgcM
         q3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399392; x=1752004192;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GaahoyBk8jDx9SFdqQfmfH84r/4wlicoROwaD8CIho=;
        b=j39Tu36Og1PLL3u+YEN0pckYSzSOMNVIpaJ7kkst8wAUl7ob/IW/4AkHTS1VXH6/1m
         MUXSYYJe4NnSqASOykh8IKGfBtnCEfb2q2YbHxycqW62pEnocqqJ525bvYhOam8gMZAk
         bWXDteGxrsE3bajtUqnQQeC+0oF9WcArxb0x8HzxNuQKusfLEYs0zRgHA6AnwywceT4I
         KLHLCJStSo+wBw6RHJO1WuTh6Q7wFY3PLvmJrMU5lYHNdopBX0FXhf/7xg8PeGTXmLd+
         uYbEH6Q3ZFJVS6HFuKD+HZtRHq34rDaaWQkjXEkmiquUi/RRaZV8LEtNAkxTO5HHQQcW
         Z54w==
X-Gm-Message-State: AOJu0YwiLAQhz+CmYRoGXzXlf7eJl/JmrlByYu8BG1Zxb9ECv34At63n
	sUdmwBKzV0wcN9Csf1SWLdk4XUrWKshuuaZV0jPRybtzPrpk2rum/sby5WuZZgF+rVW6MUCP/HY
	hNqeumanLliVoDrgrzHPN9C7f472CYjs=
X-Gm-Gg: ASbGncuEEDVC4yH5Sj4NxdivVzPgg19NKWRKGxWqm/mzevcaSXCJrRn9PbMD+xPuHWR
	dvXE/ZeQKBbja3YlxiW7OEpy3OKJ5FmXln1WvRTELKfKn6evkhmvufbBc6FNhGqAqIwhmx/G/Kh
	8DkIApSvzFBsIB9XSnJVL256k70cnNIvwq6rWE88L5NTjU69uyvkTNFKdeohKZmxTp26upKHnvM
	Pc=
X-Google-Smtp-Source: AGHT+IF/cpE/wrV72gO7dblr4LQQDmubLOmYW57inTj1vjrYLqBCUQS+x3vIOallejNhIvyiS4rZpGPn60RQ2db2eys=
X-Received: by 2002:a05:690c:6f07:b0:70f:6ebb:b29a with SMTP id
 00721157ae682-715171c7503mr271994197b3.29.1751399392419; Tue, 01 Jul 2025
 12:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Tue, 1 Jul 2025 12:49:41 -0700
X-Gm-Features: Ac12FXwAK4bxe1mPT10SOXB6lQtr-Itdz4ZmAMPjku7nIL_YWiMkRTe9BFPMDZk
Message-ID: <CAF3JpA56EJV76dTfBxYoacgBUXOptfmN4FhQcsMq_m8LDrnv5Q@mail.gmail.com>
Subject: WARNING in _ieee80211_sta_cur_vht_bw
To: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: multipart/mixed; boundary="000000000000a5c6a00638e37211"

--000000000000a5c6a00638e37211
Content-Type: text/plain; charset="UTF-8"

#syz test

--000000000000a5c6a00638e37211
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mac80211-reject-opmode-notification-for-unsupported-.patch"
Content-Disposition: attachment; 
	filename="0001-mac80211-reject-opmode-notification-for-unsupported-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mckxnq9p0>
X-Attachment-Id: f_mckxnq9p0

RnJvbSA2NzgwZjQ4NzJkNjA0MTViYmYyNjJiYzg0ZmFiMWFkODA5OTFkMWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb29uIEhlZSBMZWUgPG1vb25oZWUubGVlLmNhQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCAxIEp1bCAyMDI1IDEyOjM2OjQ4IC0wNzAwClN1YmplY3Q6IFtQQVRDSF0g
bWFjODAyMTE6IHJlamVjdCBvcG1vZGUgbm90aWZpY2F0aW9uIGZvciB1bnN1cHBvcnRlZCBjaGFu
bmVsCiB3aWR0aHMKClZIVCBvcGVyYXRpbmcgbW9kZSBub3RpZmljYXRpb24gc2hvdWxkIG5vdCBi
ZSBhcHBsaWVkIHdoZW4gdGhlIGNoYW5uZWwKd2lkdGggaXMgNSBNSHogb3IgMTAgTUh6LCBhcyBW
SFQgZG9lcyBub3Qgc3VwcG9ydCB0aG9zZSB3aWR0aHMuCgpXaXRob3V0IHRoaXMgY2hlY2ssIGEg
bWFsZm9ybWVkIG9wbW9kZSBub3RpZmljYXRpb24gd2l0aCAxMCBNSHogd2lkdGgKY2FuIHJlYWNo
IGllZWU4MDIxMV9jaGFuX3dpZHRoX3RvX3J4X2J3KCksIHRyaWdnZXJpbmcgYSBXQVJOX09OIGR1
ZSB0bwppbnZhbGlkIGNoYW5uZWwgd2lkdGguIFRoaXMgaXNzdWUgd2FzIHJlcG9ydGVkIGJ5IHN5
emJvdC4KClJlamVjdCB1bnN1cHBvcnRlZCBjaGFubmVsIHdpZHRocyBlYXJseSBpbiBzdGFfbGlu
a19hcHBseV9wYXJhbWV0ZXJzKCkKd2hlbiBvcG1vZGUgbm90aWZpY2F0aW9uIGlzIHVzZWQuCgpT
aWduZWQtb2ZmLWJ5OiBNb29uIEhlZSBMZWUgPG1vb25oZWUubGVlLmNhQGdtYWlsLmNvbT4KLS0t
CiBuZXQvbWFjODAyMTEvY2ZnLmMgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbmV0L21hYzgwMjExL2NmZy5jIGIvbmV0
L21hYzgwMjExL2NmZy5jCmluZGV4IDU2NTQwYzM3MDFlZC4uNWE2YWUwOTNhOGJkIDEwMDY0NAot
LS0gYS9uZXQvbWFjODAyMTEvY2ZnLmMKKysrIGIvbmV0L21hYzgwMjExL2NmZy5jCkBAIC0xOTgx
LDYgKzE5ODEsMjEgQEAgc3RhdGljIGludCBzdGFfbGlua19hcHBseV9wYXJhbWV0ZXJzKHN0cnVj
dCBpZWVlODAyMTFfbG9jYWwgKmxvY2FsLAogCWllZWU4MDIxMV9zdGFfaW5pdF9uc3MobGlua19z
dGEpOwogCiAJaWYgKHBhcmFtcy0+b3Btb2RlX25vdGlmX3VzZWQpIHsKKwkJZW51bSBubDgwMjEx
X2NoYW5fd2lkdGggd2lkdGggPSBsaW5rLT5jb25mLT5jaGFucmVxLm9wZXIud2lkdGg7CisKKwkJ
c3dpdGNoICh3aWR0aCkgeworCQljYXNlIE5MODAyMTFfQ0hBTl9XSURUSF8yMF9OT0hUOgorCQlj
YXNlIE5MODAyMTFfQ0hBTl9XSURUSF8yMDoKKwkJY2FzZSBOTDgwMjExX0NIQU5fV0lEVEhfNDA6
CisJCWNhc2UgTkw4MDIxMV9DSEFOX1dJRFRIXzgwOgorCQljYXNlIE5MODAyMTFfQ0hBTl9XSURU
SF8xNjA6CisJCWNhc2UgTkw4MDIxMV9DSEFOX1dJRFRIXzgwUDgwOgorCQljYXNlIE5MODAyMTFf
Q0hBTl9XSURUSF8zMjA6CisJCQlicmVhazsKKwkJZGVmYXVsdDoKKwkJCXJldHVybiAtRUlOVkFM
OworCQl9CisKIAkJLyogcmV0dXJuZWQgdmFsdWUgaXMgb25seSBuZWVkZWQgZm9yIHJjIHVwZGF0
ZSwgYnV0IHRoZQogCQkgKiByYyBpc24ndCBpbml0aWFsaXplZCBoZXJlIHlldCwgc28gaWdub3Jl
IGl0CiAJCSAqLwotLSAKMi40My4wCgo=
--000000000000a5c6a00638e37211--
