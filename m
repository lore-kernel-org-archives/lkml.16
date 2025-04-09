Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC494214A64
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744236824; cv=none; b=F/lVGF0SWRXY0t7UuJ6aIX6aXO8Sc0jj9l4t7Z/vOEt35Ye6EybzNjkvZ9uIB1YJ78OeCBX9OY5NAPt/xC5Xi50WHZ65AcPB4SnoNZyA2yUNxNVzlHYsypaz0/wbaz8J/B62BR9WSeeybVvGxAyqhZdreh3pXX5HE/JwwZYEc1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744236824; c=relaxed/simple;
	bh=xpzRcp4Ka1Tyt+GacK8iEdisWsXft9gHQ0UJH/Jbems=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=qeoUq4vp9X05DCTdKOkcNzS7CS9DE8FuldLPX99RpiCR1lkNBkJ/uRd8urc9nmtyBf8XumKnhg6+06MlIz99rpApSqUUXLTIWJ2WMMHwnsZgteUQTMqCS70+DFpHJzBXU67x/N3tBBr49m6xBvildey4qRCbWxk6z9KDhX9ylcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WegrPDXk; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WegrPDXk"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8613f456960so6898239f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744236821; x=1744841621; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sOZyIYNshi/uC4rKrNhaWGHmAAtbzVOCXThHt3xXgGA=;
        b=WegrPDXkuctiQR+gbbfpKu2VHihB9jBokCMm1FLKvXZwosCQYrWgd1VJqa+iCO4SGG
         nIo38WTUNFHFehE8pRm7H0ZFXcpXWZmpjIPkh2jKOHFGyu/R8pG1s2SjCizaxXfkuVfZ
         bslqcjZdTXU7HFsBLsoK0fXDDwHwCY/vIx0tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744236821; x=1744841621;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOZyIYNshi/uC4rKrNhaWGHmAAtbzVOCXThHt3xXgGA=;
        b=LyF/WMl6aP2YPPufi9GH4Ucykrb20g0aRtb9xcEwkQSap6Yl4ExJDqOtrdj71nsuGH
         cr6+h1DNvSgbdnIOKM3woHVxirWWFcD283nlKnD+MdEob4C+jAtvMcU9JQ3eUIo9Yx0M
         mbugYAZnbX1e/n01bZ3/6upMV9lBe7tPp7PAxidUDZZ5OiWlyrZ4DuY9JR6dziyLbX6r
         yfysa3UmAXzRkUXM+bSOJ3g27CKv6QdThB8yi7et1DvqETpAP7CjYo+JDjLfsfj4vY97
         NivXjOesfAtYjUbHNSwV6kF/dDpgZxRybWKabokd3pwF16ItG3RMgRN7qfyUkY0B5yQ2
         x3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUxBqsABBMf/N8XBcIOfGiC3DYky51AiiP9GlhWMTtssw7LEila96vS1ZCb245qYMCeH7JJc8jSW1LDCSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlv73hXzXT2mgxP8xD6rnus5PU1/jW8gvkueCmcVG3NNceYABo
	P0Y4+RF/jAqR+i5xFRHNrCi1sKDVOmgeZi9iTWdN9Z/saJsi2hybFcxZV/m4JI0=
X-Gm-Gg: ASbGncv0UOnzEvonvS/lD2QrYJKb2zotv6aY93ch/1tUl/+7DA997KlP9YPncyR+nSz
	cC2otW3ZJVSwBkQvG7o2RIcuetuP6lVH0dGi9ZTt6hmKxcgYCsd9C/DIzBN2++FDf72ehNGcJvS
	SsxTQG08BGH6ObJNxU62OsMrbp9BrN2J1FXre7TXud62rMOL3fw8HRJ75rvfsxtBBUQ3g/htNat
	4mVuWNpioEcdobHafc+6NV6MGWBqohxBDEpKcuImZxgedXNTyDCiErjShXExNOtXtRlruB33DWj
	ny8yMw2MQ5DMluAlfNwAQ2cF+7pO/T8VJUUcZ6iAs5PUHqNv/BAzM+w17O48yA==
X-Google-Smtp-Source: AGHT+IEcFbkLjNVeVV2IRBR2ch4Mk83Cf5DzulAWeocqV95gWGdGEQbBdBT5rhoA3QaCfCGk89IjeQ==
X-Received: by 2002:a05:6602:474a:b0:861:6f2a:ae64 with SMTP id ca18e2360f4ac-86170565aaemr3792839f.0.1744236820746;
        Wed, 09 Apr 2025 15:13:40 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165426285sm37114939f.12.2025.04.09.15.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 15:13:40 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------IHEiv8zrIWtWFzS0PBG03iHT"
Message-ID: <aa092d10-f3d5-4714-98be-bd6fabd4225d@linuxfoundation.org>
Date: Wed, 9 Apr 2025 16:13:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] Kselftest fixes update for Linux 6.15-rc2

This is a multi-part message in MIME format.
--------------IHEiv8zrIWtWFzS0PBG03iHT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the following kselftest fixes update for Linux 6.15-rc2

Fixes tpm2, futex, and mincore tests. Creates a dedicated .gitignore
for tpm2

Details:

selftests: tpm2: test_smoke: use POSIX-conformant expression operator
selftests/futex: futex_waitv wouldblock test should fail
selftests: tpm2: create a dedicated .gitignore
selftests/mincore: Allow read-ahead pages to reach the end of the file

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-6.15-rc2

for you to fetch changes up to 197c1eaa7ba633a482ed7588eea6fd4aa57e08d4:

   selftests/mincore: Allow read-ahead pages to reach the end of the file (2025-04-08 17:08:50 -0600)

----------------------------------------------------------------
linux_kselftest-fixes-6.15-rc2

Fixes tpm2, futex, and mincore tests. Creates a dedicated .gitignore
for tpm2

Details:

selftests: tpm2: test_smoke: use POSIX-conformant expression operator
selftests/futex: futex_waitv wouldblock test should fail
selftests: tpm2: create a dedicated .gitignore
selftests/mincore: Allow read-ahead pages to reach the end of the file

----------------------------------------------------------------
Ahmed Salem (1):
       selftests: tpm2: test_smoke: use POSIX-conformant expression operator

Edward Liaw (1):
       selftests/futex: futex_waitv wouldblock test should fail

Khaled Elnaggar (1):
       selftests: tpm2: create a dedicated .gitignore

Qiuxu Zhuo (1):
       selftests/mincore: Allow read-ahead pages to reach the end of the file

  tools/testing/selftests/.gitignore                               | 1 -
  tools/testing/selftests/futex/functional/futex_wait_wouldblock.c | 2 +-
  tools/testing/selftests/mincore/mincore_selftest.c               | 3 ---
  tools/testing/selftests/tpm2/.gitignore                          | 3 +++
  tools/testing/selftests/tpm2/test_smoke.sh                       | 2 +-
  5 files changed, 5 insertions(+), 6 deletions(-)
  create mode 100644 tools/testing/selftests/tpm2/.gitignore
----------------------------------------------------------------
--------------IHEiv8zrIWtWFzS0PBG03iHT
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-fixes-6.15-rc2.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-fixes-6.15-rc2.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLy5naXRpZ25vcmUgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy8uZ2l0aWdub3JlCmluZGV4IGNiMjQxMjRhYzViOS4uNjc0
YWFhMDJlMzk2IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy8uZ2l0aWdu
b3JlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzLy5naXRpZ25vcmUKQEAgLTQsNyAr
NCw2IEBAIGdwaW9ncGlvLWhhbW1lcgogZ3Bpb2luY2x1ZGUvCiBncGlvbHNncGlvCiBrc2Vs
ZnRlc3RfaW5zdGFsbC8KLXRwbTIvU3BhY2VUZXN0LmxvZwogCiAjIFB5dGhvbiBieXRlY29k
ZSBhbmQgY2FjaGUKIF9fcHljYWNoZV9fLwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvZnV0ZXgvZnVuY3Rpb25hbC9mdXRleF93YWl0X3dvdWxkYmxvY2suYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z1dGV4L2Z1bmN0aW9uYWwvZnV0ZXhfd2FpdF93b3Vs
ZGJsb2NrLmMKaW5kZXggN2Q3YTZhMDZjZGI3Li4yZDgyMzBkYTkwNjQgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z1dGV4L2Z1bmN0aW9uYWwvZnV0ZXhfd2FpdF93
b3VsZGJsb2NrLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnV0ZXgvZnVuY3Rp
b25hbC9mdXRleF93YWl0X3dvdWxkYmxvY2suYwpAQCAtOTgsNyArOTgsNyBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCWluZm8oIkNhbGxpbmcgZnV0ZXhfd2FpdHYg
b24gZjE6ICV1IEAgJXAgd2l0aCB2YWw9JXVcbiIsIGYxLCAmZjEsIGYxKzEpOwogCXJlcyA9
IGZ1dGV4X3dhaXR2KCZ3YWl0diwgMSwgMCwgJnRvLCBDTE9DS19NT05PVE9OSUMpOwogCWlm
ICghcmVzIHx8IGVycm5vICE9IEVXT1VMREJMT0NLKSB7Ci0JCWtzZnRfdGVzdF9yZXN1bHRf
cGFzcygiZnV0ZXhfd2FpdHYgcmV0dXJuZWQ6ICVkICVzXG4iLAorCQlrc2Z0X3Rlc3RfcmVz
dWx0X2ZhaWwoImZ1dGV4X3dhaXR2IHJldHVybmVkOiAlZCAlc1xuIiwKIAkJCQkgICAgICBy
ZXMgPyBlcnJubyA6IHJlcywKIAkJCQkgICAgICByZXMgPyBzdHJlcnJvcihlcnJubykgOiAi
Iik7CiAJCXJldCA9IFJFVF9GQUlMOwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbWluY29yZS9taW5jb3JlX3NlbGZ0ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9taW5jb3JlL21pbmNvcmVfc2VsZnRlc3QuYwppbmRleCBlOTQ5YTQzYTYxNDUuLmVm
YWJmY2JlMGI0OSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbWluY29y
ZS9taW5jb3JlX3NlbGZ0ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbWlu
Y29yZS9taW5jb3JlX3NlbGZ0ZXN0LmMKQEAgLTI2MSw5ICsyNjEsNiBAQCBURVNUKGNoZWNr
X2ZpbGVfbW1hcCkKIAkJVEhfTE9HKCJObyByZWFkLWFoZWFkIHBhZ2VzIGZvdW5kIGluIG1l
bW9yeSIpOwogCX0KIAotCUVYUEVDVF9MVChpLCB2ZWNfc2l6ZSkgewotCQlUSF9MT0coIlJl
YWQtYWhlYWQgcGFnZXMgcmVhY2hlZCB0aGUgZW5kIG9mIHRoZSBmaWxlIik7Ci0JfQogCS8q
CiAJICogRW5kIG9mIHRoZSByZWFkYWhlYWQgd2luZG93LiBUaGUgcmVzdCBvZiB0aGUgcGFn
ZXMgc2hvdWxkbid0CiAJICogYmUgaW4gbWVtb3J5LgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvdHBtMi8uZ2l0aWdub3JlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvdHBtMi8uZ2l0aWdub3JlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uNmQ2MTY1YzVlMzVkCi0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvdHBtMi8uZ2l0aWdub3JlCkBAIC0wLDAgKzEsMyBAQAorIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CitBc3luY1Rlc3QubG9nCitTcGFjZVRlc3Qu
bG9nCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90cG0yL3Rlc3Rfc21v
a2Uuc2ggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90cG0yL3Rlc3Rfc21va2Uuc2gKaW5k
ZXggMTY4ZjRiMTY2MjM0Li4zYTYwZTZjNmY1YzkgMTAwNzU1Ci0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3RwbTIvdGVzdF9zbW9rZS5zaAorKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy90cG0yL3Rlc3Rfc21va2Uuc2gKQEAgLTYsNiArNiw2IEBAIGtzZnRfc2tpcD00
CiAKIFsgLWUgL2Rldi90cG0wIF0gfHwgZXhpdCAka3NmdF9za2lwCiByZWFkIHRwbV92ZXJz
aW9uIDwgL3N5cy9jbGFzcy90cG0vdHBtMC90cG1fdmVyc2lvbl9tYWpvcgotWyAiJHRwbV92
ZXJzaW9uIiA9PSAyIF0gfHwgZXhpdCAka3NmdF9za2lwCitbICIkdHBtX3ZlcnNpb24iID0g
MiBdIHx8IGV4aXQgJGtzZnRfc2tpcAogCiBweXRob24zIC1tIHVuaXR0ZXN0IC12IHRwbTJf
dGVzdHMuU21va2VUZXN0IDI+JjEK

--------------IHEiv8zrIWtWFzS0PBG03iHT--
