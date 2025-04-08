Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003022DFA4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151515; cv=none; b=NmDD7eeQu4BHgaP+gMNJNguXhsSkDvXqrftfo5TTbFvpK5kGBzy02rc6h3WaHF2cRWy4xHjaSwIhXNI966wtI1UDo8zFHevi7ese4V/o8Y7sc99CyKmYDk5SRaon3mj7GtACH04/7gJ6LoFAGYHUPwPMWYTHWLY3IkqvrepEl4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151515; c=relaxed/simple;
	bh=4WOkA299ieTu7VuMb8Ojo+52kG+DAoRovBqg0oHZuHc=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=MWRJ0oZ8XoKy3GuwYd3sQXBSQNMPCrk9c8qIzkfuzD4cXYRNeBbGFxnDqus15Pxn9R28T/hmF8AboIeAaM9LVukqz6zZMIsMk7KltODxPYDZL5lkLxksMa8fCTyfWkrzAtSEUzOMy7l6DZyQ3MI1Lqn1MX/uQlJ2Oj213rxdULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TD1emFMc; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TD1emFMc"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so140919439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744151512; x=1744756312; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pAWzVkguP8Oqw2TYk2JCRWfNXIScPDbjXxeh1BiAU14=;
        b=TD1emFMc1XY5YM6vwmFWqrCXtLOoqZUwv5Nf/jAE/LIDI1szPVQN7inTDmCdDoDl1R
         sDnrTwqkJEKmI4ONIm5h2F20yDxC22qk8AOyi8nSthFX3+rvqY3S8njAQr4yQjW/zKWx
         4IGfMHDcnERFH6RMvn6dn50ll/A60CbRUFwJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151512; x=1744756312;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAWzVkguP8Oqw2TYk2JCRWfNXIScPDbjXxeh1BiAU14=;
        b=cczkh9Ay8QcTVGswh+mUCUW55KCZVySv0ct/ACzIIq7EP0lGgMYKgOaJk4jrZmjVO/
         /71aWBra8QPC65I2Sh2pxT3q2SmgpxayWUMgl0+ryw1wF+vndVwfCweyNLI17y3wRq8t
         f2EI7CEec2u8+36Ph6/86L2vcSkaNhjLdjSnwAcYHSp/cmprSZQ39lJ7HMFuvj1Kc/iM
         QwCu+AVwuo8M41ZTDvwyy78y4KKzwQ0yi0ovBZIxIZJNgUBbTbX0njztWbKeqe0WHN6a
         dAfUCIkn7Oisx+J5r9/uowU/N0YvmCZnCwQyFhc6u1Lvpl40Fn325099nx74If45cDj/
         M0Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXFWo4cj7SqUMV48B6Hg+8XQwsg+LJAcQiSYCl94wTxYyMNL3HUJSna5jGMiVfgD5qmqpTpNw1j2dnTtE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxcsGwvJVB4JG3hPbBTyKFiOVlFxEAebxmrQm7ggwQ9QPL0uY
	dJ/q5LU6RdH3HTQB420vDdKeh3EaPujwg9QXfWA1gdaxhX5ze32jJ944Ks1vOG4=
X-Gm-Gg: ASbGncsW0opD+BI6eC9kR5+vpxmSqZcBvW/MTC8XmXCUYufgHn0KUIGf9R2osFglSSr
	hrWkM42lPnh0r41Z6vFWbAblh7voV/ClNEIIIQMapcfCjspPccZtPbhl9kSwSFuKXqUcmLW0iFJ
	ylIVNjM7esYeNs0xv8UM8Vzio/rw1QwmIt1f2V/ifqTBS1yTvzJERVvU5Ogbw7lozJI/35/lno1
	bdOrt6U3rOjpEl4MtdmdX3weBr7NuI/KyKcKHgGQz75ZR8QAFsmumRdCYbeadHHuNl8+jQCc7zP
	tEF0oPYGCduym4vXkKXCmXJb1LN+7cNO2VVJQHAgEhQaA0aAx916GAaZ04stVtKxdQ==
X-Google-Smtp-Source: AGHT+IEfU144XCFxHWsCH0yxmIdhaFa8gc+53jrOeBtBx03pWvxKk+tMbW+YaftBfnJpMNV8mVT1+g==
X-Received: by 2002:a05:6602:29aa:b0:85e:1ee9:1c18 with SMTP id ca18e2360f4ac-86161281c7fmr113057939f.9.1744151511647;
        Tue, 08 Apr 2025 15:31:51 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f45087f8sm701807173.140.2025.04.08.15.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 15:31:51 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------MZJPVxq8LCD2OpAvMYg7TYnf"
Message-ID: <a39f11cb-a88e-4275-9fe7-8a000ccdefd7@linuxfoundation.org>
Date: Tue, 8 Apr 2025 16:31:50 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit fixes update for Linux 6.15-rc2

This is a multi-part message in MIME format.
--------------MZJPVxq8LCD2OpAvMYg7TYnf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the following kunit fixes update for Linux 6.15-rc2

Fixes tool to report test count in case of a late test plan when tests
are specified before the test plan. Fixes spelling error in the commit
that went into 6.15-rc1.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-6.15-rc2

for you to fetch changes up to d1be0cf3b8aeae75bc8fff5b7a3e01ebfe276008:

   kunit: Spelling s/slowm/slow/ (2025-04-08 14:57:24 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-6.15-rc2

Fixes tool to report test count in case of a late test plan when tests
are specified before the test plan. Fixes spelling error in the commit
that went into 6.15-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (1):
       kunit: Spelling s/slowm/slow/

Rae Moar (1):
       kunit: tool: fix count of tests if late test plan

  include/kunit/test.h                   | 2 +-
  tools/testing/kunit/kunit_parser.py    | 4 ++++
  tools/testing/kunit/kunit_tool_test.py | 4 ++--
  3 files changed, 7 insertions(+), 3 deletions(-)
----------------------------------------------------------------
--------------MZJPVxq8LCD2OpAvMYg7TYnf
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-6.15-rc2.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-kunit-6.15-rc2.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2luY2x1ZGUva3VuaXQvdGVzdC5oIGIvaW5jbHVkZS9rdW5pdC90ZXN0
LmgKaW5kZXggMGZmYjk3Yzc4NTY2Li4zOWM3NjhmODdkYzkgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUva3VuaXQvdGVzdC5oCisrKyBiL2luY2x1ZGUva3VuaXQvdGVzdC5oCkBAIC02Nyw3ICs2
Nyw3IEBAIGVudW0ga3VuaXRfc3RhdHVzIHsKIAogLyoKICAqIFNwZWVkIEF0dHJpYnV0ZSBp
cyBzdG9yZWQgYXMgYW4gZW51bSBhbmQgc2VwYXJhdGVkIGludG8gY2F0ZWdvcmllcyBvZgot
ICogc3BlZWQ6IHZlcnlfc2xvd20sIHNsb3csIGFuZCBub3JtYWwuIFRoZXNlIHNwZWVkcyBh
cmUgcmVsYXRpdmUgdG8KKyAqIHNwZWVkOiB2ZXJ5X3Nsb3csIHNsb3csIGFuZCBub3JtYWwu
IFRoZXNlIHNwZWVkcyBhcmUgcmVsYXRpdmUgdG8KICAqIG90aGVyIEtVbml0IHRlc3RzLgog
ICoKICAqIE5vdGU6IHVuc2V0IHNwZWVkIGF0dHJpYnV0ZSBhY3RzIGFzIGRlZmF1bHQgb2Yg
S1VOSVRfU1BFRURfTk9STUFMLgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9rdW5pdC9r
dW5pdF9wYXJzZXIucHkgYi90b29scy90ZXN0aW5nL2t1bml0L2t1bml0X3BhcnNlci5weQpp
bmRleCBkYTUzYTcwOTc3M2EuLmMxNzY0ODczNTZlNiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVz
dGluZy9rdW5pdC9rdW5pdF9wYXJzZXIucHkKKysrIGIvdG9vbHMvdGVzdGluZy9rdW5pdC9r
dW5pdF9wYXJzZXIucHkKQEAgLTgwOSw2ICs4MDksMTAgQEAgZGVmIHBhcnNlX3Rlc3QobGlu
ZXM6IExpbmVTdHJlYW0sIGV4cGVjdGVkX251bTogaW50LCBsb2c6IExpc3Rbc3RyXSwgaXNf
c3VidGVzdDoKIAkJdGVzdC5sb2cuZXh0ZW5kKHBhcnNlX2RpYWdub3N0aWMobGluZXMpKQog
CQlpZiB0ZXN0Lm5hbWUgIT0gIiIgYW5kIG5vdCBwZWVrX3Rlc3RfbmFtZV9tYXRjaChsaW5l
cywgdGVzdCk6CiAJCQl0ZXN0LmFkZF9lcnJvcihwcmludGVyLCAnbWlzc2luZyBzdWJ0ZXN0
IHJlc3VsdCBsaW5lIScpCisJCWVsaWYgbm90IGxpbmVzOgorCQkJcHJpbnRfbG9nKHRlc3Qu
bG9nLCBwcmludGVyKQorCQkJdGVzdC5zdGF0dXMgPSBUZXN0U3RhdHVzLk5PX1RFU1RTCisJ
CQl0ZXN0LmFkZF9lcnJvcihwcmludGVyLCAnTm8gbW9yZSB0ZXN0IHJlc3VsdHMhJykKIAkJ
ZWxzZToKIAkJCXBhcnNlX3Rlc3RfcmVzdWx0KGxpbmVzLCB0ZXN0LCBleHBlY3RlZF9udW0s
IHByaW50ZXIpCiAKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXRfdG9v
bF90ZXN0LnB5IGIvdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF90b29sX3Rlc3QucHkKaW5k
ZXggNWZmNGY2ZmZkODczLi5iYmJhOTIxZTBlYWMgMTAwNzU1Ci0tLSBhL3Rvb2xzL3Rlc3Rp
bmcva3VuaXQva3VuaXRfdG9vbF90ZXN0LnB5CisrKyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQv
a3VuaXRfdG9vbF90ZXN0LnB5CkBAIC0zNzEsOCArMzcxLDggQEAgY2xhc3MgS1VuaXRQYXJz
ZXJUZXN0KHVuaXR0ZXN0LlRlc3RDYXNlKToKIAkJIiIiCiAJCXJlc3VsdCA9IGt1bml0X3Bh
cnNlci5wYXJzZV9ydW5fdGVzdHMob3V0cHV0LnNwbGl0bGluZXMoKSwgc3Rkb3V0KQogCQkj
IE1pc3NpbmcgdGVzdCByZXN1bHRzIGFmdGVyIHRlc3QgcGxhbiBzaG91bGQgYWxlcnQgYSBz
dXNwZWN0ZWQgdGVzdCBjcmFzaC4KLQkJc2VsZi5hc3NlcnRFcXVhbChrdW5pdF9wYXJzZXIu
VGVzdFN0YXR1cy5URVNUX0NSQVNIRUQsIHJlc3VsdC5zdGF0dXMpCi0JCXNlbGYuYXNzZXJ0
RXF1YWwocmVzdWx0LmNvdW50cywga3VuaXRfcGFyc2VyLlRlc3RDb3VudHMocGFzc2VkPTEs
IGNyYXNoZWQ9MSwgZXJyb3JzPTEpKQorCQlzZWxmLmFzc2VydEVxdWFsKGt1bml0X3BhcnNl
ci5UZXN0U3RhdHVzLlNVQ0NFU1MsIHJlc3VsdC5zdGF0dXMpCisJCXNlbGYuYXNzZXJ0RXF1
YWwocmVzdWx0LmNvdW50cywga3VuaXRfcGFyc2VyLlRlc3RDb3VudHMocGFzc2VkPTEsIGVy
cm9ycz0yKSkKIAogZGVmIGxpbmVfc3RyZWFtX2Zyb21fc3RycyhzdHJzOiBJdGVyYWJsZVtz
dHJdKSAtPiBrdW5pdF9wYXJzZXIuTGluZVN0cmVhbToKIAlyZXR1cm4ga3VuaXRfcGFyc2Vy
LkxpbmVTdHJlYW0oZW51bWVyYXRlKHN0cnMsIHN0YXJ0PTEpKQo=

--------------MZJPVxq8LCD2OpAvMYg7TYnf--
