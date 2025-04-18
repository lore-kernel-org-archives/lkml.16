Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D21481A3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997011; cv=none; b=PPtnEKcwG66Htod8a4660xMtTbV2zRYsmGtNhNYym3QlRNvTswkUap3wjgsV6fg1PhgyeESLKf3EmF6axxKYbVibLHEWR6N6asFfqJkyouMAKpQ+2rLEX7qcvTyvDUJ3sv6LIC4HZg1BB9/t+dQD+T2fpOBhc2USjWdj/IqEbzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997011; c=relaxed/simple;
	bh=n2ldmeXj1pt9OhP4eN76Q1VDZqHVEvRwrsozAmyirn0=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc; b=FSnqEnIGCwAWvL81Exo8JyjTpfOrxratHm4iGVyFbpaliKNp5s/X4ntuMSZ5Y+oBIXhwMq3RfMf+cwquvAujQPZi5ABL5yfSlMq7o4Ij7PtfVImOjlrpng6bFDm1IbWf9S5Nk+A3QjFKQTcsUZrFw2U2/jto+zmHcGI5OVJ/wAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PS+L4yTl; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PS+L4yTl"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso65173539f.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744997008; x=1745601808; darn=vger.kernel.org;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a+N+3lsdw5hJgFDluXx537uN6IRA+NpDIajXfy7Sh7o=;
        b=PS+L4yTldSeY5srmL75q21AT4aI309tlOqm7o8ValxBzmqrUTkdMxzfLGznYbfScMo
         3GfxwZhyVhIbCr9RF4gK97qLiFQq+bldOE+hCzlRUiKBJuN3XLHzL7iyLfd4n2B10sRD
         7aBWkK0d/xUqflKiBoH0h8e0w/fqgjeI7XjC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997008; x=1745601808;
        h=cc:to:subject:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+N+3lsdw5hJgFDluXx537uN6IRA+NpDIajXfy7Sh7o=;
        b=w4CoJn1QNsFoLUbrjRlz9zsxB/GnxZl1P1E7xAwI36PbOX3z/R+NDgtlTYlunu49vp
         hOsrYkJG72FAGG/f0YoN2+MYu2vTvH3kisNMXPqqCUUvCzPFMwoyD2pu/hDoT2Lc0Ugr
         v8d6usA6Z8mlaDX15RgDj7YiH0mXQyAMy4oZdyPEfvVhwagjc+GNkfDXr+bVbMg/xpEz
         OI3b2RHeR3UgrKXMGXLzrC0OH2Kh6Nk8S8mmqIMEugy9bchVDUyahPAZ7OGNxXktKg5y
         8Q3RBZ7ZfJ9kQFyJ3QAOO31hj+D44Oh/olJpUtmVtWF7TuR8u1mk0CKQXLoLK7GZSKt1
         GNcA==
X-Forwarded-Encrypted: i=1; AJvYcCUozSTSDoVbDgachoSqffzd77opViw0e2CXIFAG5zy1PlbbhCJNMo0L2VTFibnPqTu+IMLtEG43LdYRaDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOK7iObB1XNpJnRdb+YnAk+NcN9r36y9Af7dWp+th0Af0cHaFx
	9uzS/SK2ApfdGWYM8BHZaAJnZvQQia0b2C/U2WU/zHVmYZPeRZtSh0eEKSbLQkw=
X-Gm-Gg: ASbGncsPC1m4L+8wjmKmQma/0WPGtlr1IH9OubhhF+++Js1cbMJ59HcShprJYX+8JNa
	Wl9tfZVqiyUeKGyF9DdcHis4jB2cYmHPAKVXVHflKGOmBpv4SuA7xNPRp3v5CRHI6M3uzJLued4
	hmCDlfdFgEsClKA+hRQbQXeH2RhXa3xle9Qx8fyFS55+U23COhvM6DXdObW5LOIjcj669FvYguW
	QmxT4W0lBaAHpWvuon3YquUiatcibc1cxtGdlpqyHeCclEOC4H6NS/9yOrqBN/YXFkcF/+nhzNq
	W3fUi6OzzcR3r2nRfrY46e+zOsaT0cLv/bJq5WJ1OSmTm1XAn+M=
X-Google-Smtp-Source: AGHT+IHKErtBofMBPkKdVBXFdnABq54/jBmrTk0I3oM9V2qqA8HmhEhsAHIkz62xA4Y6AOCSNBSnbg==
X-Received: by 2002:a05:6602:4a0a:b0:861:d71f:33e3 with SMTP id ca18e2360f4ac-861dbe0d25emr377632539f.5.1744997008523;
        Fri, 18 Apr 2025 10:23:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a3833b1esm536214173.59.2025.04.18.10.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 10:23:28 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------YKCSxzmDKGBuq6M5HqVObpp3"
Message-ID: <e8852bc2-6013-4486-997b-e001f3dc9909@linuxfoundation.org>
Date: Fri, 18 Apr 2025 11:23:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] Kselftest fixes update for Linux 6.15-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------YKCSxzmDKGBuq6M5HqVObpp3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull the following kselftest fixes update for Linux 6.15-rc3.

Fixes dynevent_limitations.tc test failure on dash by detecting and
handling bash and dash differences in evaluating \\.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

   Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-6.15-rc3

for you to fetch changes up to 07be53cfa81afe94b14fb4bfee8243f2e0125d5e:

   selftests/ftrace: Differentiate bash and dash in dynevent_limitations.tc (2025-04-16 12:47:41 -0600)

----------------------------------------------------------------
linux_kselftest-fixes-6.15-rc3

Fixes dynevent_limitations.tc test failure on dash by detecting and
handling bash and dash differences in evaluating \\.

----------------------------------------------------------------
Steven Rostedt (1):
       selftests/ftrace: Differentiate bash and dash in dynevent_limitations.tc

  .../ftrace/test.d/dynevent/dynevent_limitations.tc | 23 +++++++++++++++++++++-
  1 file changed, 22 insertions(+), 1 deletion(-)
----------------------------------------------------------------
--------------YKCSxzmDKGBuq6M5HqVObpp3
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-fixes-6.15-rc3.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-fixes-6.15-rc3.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZHlu
ZXZlbnQvZHluZXZlbnRfbGltaXRhdGlvbnMudGMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9mdHJhY2UvdGVzdC5kL2R5bmV2ZW50L2R5bmV2ZW50X2xpbWl0YXRpb25zLnRjCmluZGV4
IDZiOTRiNjc4NzQxYS4uZjY1NmJjY2IxYTE0IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9mdHJhY2UvdGVzdC5kL2R5bmV2ZW50L2R5bmV2ZW50X2xpbWl0YXRpb25z
LnRjCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Z0cmFjZS90ZXN0LmQvZHluZXZl
bnQvZHluZXZlbnRfbGltaXRhdGlvbnMudGMKQEAgLTcsMTEgKzcsMzIgQEAKIE1BWF9BUkdT
PTEyOAogRVhDRUVEX0FSR1M9JCgoTUFYX0FSR1MgKyAxKSkKIAorIyBiYXNoIGFuZCBkYXNo
IGV2YWx1YXRlIHZhcmlhYmxlcyBkaWZmZXJlbnRseS4KKyMgZGFzaCB3aWxsIGV2YWx1YXRl
ICdcXCcgZXZlcnkgdGltZSBpdCBpcyByZWFkIHdoZXJlYXMgYmFzaCBkb2VzIG5vdC4KKyMK
KyMgICBURVNUX1NUUklORz0iJFRFU1RfU1RSSU5HIFxcJGkiCisjICAgZWNobyAkVEVTVF9T
VFJJTkcKKyMKKyMgV2l0aCBpPTEyMworIyBPbiBiYXNoLCB0aGF0IHdpbGwgcHJpbnQgIlwx
MjMiCisjIGJ1dCBvbiBkYXNoLCB0aGF0IHdpbGwgcHJpbnQgdGhlIGVzY2FwZSBzZXF1ZW5j
ZSBvZiBcMTIzIGFzIHRoZSBcIHdpbGwKKyMgYmUgaW50ZXJwcmV0ZWQgYWdhaW4gaW4gdGhl
IGVjaG8uCisjCisjIFNldCBhIHZhcmlhYmxlICJicyIgdG8gc2F2ZSBhIGRvdWJsZSBiYWNr
c2xhc2gsIHRoZW4gZWNobyB0aGF0CisjIHRvICJ0cyIgdG8gc2VlIGlmICR0cyBjaGFuZ2Vk
IG9yIG5vdC4gSWYgaXQgY2hhbmdlZCwgaXQncyBkYXNoLAorIyBpZiBub3QsIGl0J3MgYmFz
aCwgYW5kIHRoZW4gYnMgY2FuIGVxdWFsIGEgc2luZ2xlIGJhY2tzbGFzaC4KK2JzPSdcXCcK
K3RzPWBlY2hvICRic2AKK2lmIFsgIiR0cyIgPSAnXFwnIF07IHRoZW4KKyAgIyB0aGlzIGlz
IGJhc2gKKyAgYnM9J1wnCitmaQorCiBjaGVja19tYXhfYXJncygpIHsgIyBldmVudF9oZWFk
ZXIKICAgVEVTVF9TVFJJTkc9JDEKICAgIyBBY2NlcHRhYmxlCiAgIGZvciBpIGluIGBzZXEg
MSAkTUFYX0FSR1NgOyBkbwotICAgIFRFU1RfU1RSSU5HPSIkVEVTVF9TVFJJTkcgXFwkaSIK
KyAgICBURVNUX1NUUklORz0iJFRFU1RfU1RSSU5HICRicyRpIgogICBkb25lCiAgIGVjaG8g
IiRURVNUX1NUUklORyIgPj4gZHluYW1pY19ldmVudHMKICAgZWNobyA+IGR5bmFtaWNfZXZl
bnRzCg==

--------------YKCSxzmDKGBuq6M5HqVObpp3--
