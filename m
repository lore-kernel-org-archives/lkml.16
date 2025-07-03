Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4796521ADB5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576780; cv=none; b=aifvTJ4NqTRGSBYYFVMtM7Ue2NtbfK1JEmcXQeCssayEBUN39pFrGF23e9Cz2ZftadQ5JeszfR8C4Ru3vEWLi8wfAiiLyWSCYqnC/3d2r8IQAEg39BSZc/sVnMoRf4JGLZ9stC9QtrPUpW9ExCHWpqZyIUEGG4WbMZjiCEMM7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576780; c=relaxed/simple;
	bh=uQGt9Zk0RzkKtkDZjjxX1yLFuZ9XcpAlSiDmgdoA8NY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=N/2rbdq4ay4pB5XuRXYn6x+re7IYZLTQOpxAz67F4dYP6zVh+zoHirdekx/aIjak+MaIDv5NqX8hQ1LjnDJ8gVX6LJnGGCCBUF1e22zuRnH5ZYBSe66u+CVVAhhVF9Oux/3BOVmksLZdpoxALOore7ie22JQLH6MUYGRwManCwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=CmCclJQf; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="CmCclJQf"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d41b04bf6fso31534385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1751576776; x=1752181576; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWkZxfkZ0Htc4RbWuuAsVTXRzJPmLe/St2Y2SzAth4A=;
        b=CmCclJQfEeaXSGegIZRSIPq5IcWNESqz/sG03wSBW0tr/GH8H63HAuKg9k2K/4BNpk
         8VUCWmtAPvA4GXW1+BTAYrrh6Tu+Qo5uO5rtaDeaXGhcYg6J/qdWqXD2W56WPh0miPTj
         pDyeaYoLJgQvIJNVTChUTzAwhDzDHXkZKj48O/EW6rxrvGotfsyzO9olk2PkBVqJKIpu
         8IaX74YRcQd+0jwytRWnjzw9PvcaQGF+lgXg0dCe3ViwAhUQSq6mJSmGvagxcAuE/cgu
         FbRvdUko2D6S61SYILOE+J35SPRsNP8esYhsAzBJzdzH+EnXU/MFyPi2YkeNGjFj18Gg
         SbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751576776; x=1752181576;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zWkZxfkZ0Htc4RbWuuAsVTXRzJPmLe/St2Y2SzAth4A=;
        b=rSIWjMIYVWC9am3mRIOEH36XiRQBNVKXTuDIF+S6jfNL/gAjqZGEpNXBb8iYRj3Fe4
         ROe3JX+Yw9feKmP9E6hNqk1AZ0oOn/b7iogDVRmaDFlhop5CECZN7WlV3hI+7Z94yD/1
         TxHFO7TfmnjHIi9vGyiTi2/uws/Vcl5XOoZ/rOVb6u+blul3CGuO2A4tL8vXBGGH/WFE
         R2hn2/5Y4pnN+cRPZn6qXfkighvnyfwtV2Ex6FrLlEi9nUdrZS6at48YhZLNPkgtQwkm
         lEjNUs57auzAqTTbhUTB+9gNGUCGi/oFFaWXh6H5toNqoZ8cDvd6UGIipdTgNGpner/p
         XaVA==
X-Forwarded-Encrypted: i=1; AJvYcCUg6Tw3U49hAEsUgvy0tVPM02/RhbDD3O5PF8LTvU98Wk+hldkvHQkl0z7+kF13FJznBrtrT19VTFOm4ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvZmtvbHLN3Lg9fqMZrR8lGQotSiZP/i1cEn0WinGO2juJ3S81
	E87RAcPQ7SM4pRLrzQEKWF9JV2sj1QaGO6izOi1r/+Op0BmPo7AvgnkDFaDEqUB6pA==
X-Gm-Gg: ASbGncsaex47EAQ0nWHxYuZJrp97055Utye4zNm3gEX5k3SzQ2N40eewiBJehG2Zj/q
	3xUi42BOPczx5Dyi7POajiKRFv/MMqdJrQw7B8c6Q0OTgqb04wgWeIp7EkeFdaRXaI5O/8xoCVi
	QtP5colwyegIN+XAxjynUXR6DtFOdigiwL9A2f/Lt6Jw5Q/DUKJjln0tMt15ky3O5/m8MhUUzv7
	AM6AVr1XOxL2SX+M2MQEjmy+WccGyy475acuP7yklcW452rcfqvwXxUj+fMKyPKWaYuKvk9slWU
	i8lG7sfnE8OAyiel/R+wb2ydJRkze8SFSTNu0Uw36a1D8+E2aYX5U//aSs/c6OpoijSCyD7KYOg
	qteKy96psRyr9IxmL2XT5uNO6txT9y7SMK8cIIj/P
X-Google-Smtp-Source: AGHT+IGpL3CQYrQI7E6p7zbnmQqLnVMLDfg3F4iR9KEGXrFGQDVPrO6ilb+9pB3Fwk/dt1vEFpvL/g==
X-Received: by 2002:a05:620a:170b:b0:7d4:3811:84b6 with SMTP id af79cd13be357-7d5dccf4a25mr76983185a.32.1751576776032;
        Thu, 03 Jul 2025 14:06:16 -0700 (PDT)
Received: from ?IPV6:2804:7f1:e2c1:ca4a:289:b941:38b9:cf01? ([2804:7f1:e2c1:ca4a:289:b941:38b9:cf01])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c477sm50051585a.75.2025.07.03.14.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 14:06:15 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------l5XmQQGS9Ad3RpFyn26aEMqN"
Message-ID: <f14f4c0f-dc5d-454e-b5ef-1143b5a8f512@mojatatu.com>
Date: Thu, 3 Jul 2025 18:06:11 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [net?] general protection fault in htb_qlen_notify
To: syzbot <syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com>,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com
References: <68666a48.a00a0220.c7b3.0003.GAE@google.com>
Content-Language: en-US
From: Victor Nogueira <victor@mojatatu.com>
In-Reply-To: <68666a48.a00a0220.c7b3.0003.GAE@google.com>

This is a multi-part message in MIME format.
--------------l5XmQQGS9Ad3RpFyn26aEMqN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 08:32, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    bd475eeaaf3c Merge branch '200GbE' of git://git.kernel.org..
> git tree:       net
> console output: https://syzkaller.appspot.com/x/log.txt?x=15cc0582580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=36b0e72cad5298f8
> dashboard link: https://syzkaller.appspot.com/bug?extid=d8b58d7b0ad89a678a16
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1113748c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10909ebc580000

#syz test
--------------l5XmQQGS9Ad3RpFyn26aEMqN
Content-Type: text/x-patch; charset=UTF-8; name="htb_null_deref_fix.patch"
Content-Disposition: attachment; filename="htb_null_deref_fix.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL25ldC9zY2hlZC9zY2hfYXBpLmMgYi9uZXQvc2NoZWQvc2NoX2FwaS5j
CmluZGV4IGQ4YTMzNDg2YzUxMS4uODQ3MTA5ZGM1ZmE1IDEwMDY0NAotLS0gYS9uZXQvc2No
ZWQvc2NoX2FwaS5jCisrKyBiL25ldC9zY2hlZC9zY2hfYXBpLmMKQEAgLTM0MiwxMSArMzQy
LDExIEBAIHN0YXRpYyBzdHJ1Y3QgUWRpc2MgKnFkaXNjX2xlYWYoc3RydWN0IFFkaXNjICpw
LCB1MzIgY2xhc3NpZCkKIAljb25zdCBzdHJ1Y3QgUWRpc2NfY2xhc3Nfb3BzICpjb3BzID0g
cC0+b3BzLT5jbF9vcHM7CiAKIAlpZiAoY29wcyA9PSBOVUxMKQotCQlyZXR1cm4gTlVMTDsK
KwkJcmV0dXJuIEVSUl9QVFIoLUVPUE5PVFNVUFApOwogCWNsID0gY29wcy0+ZmluZChwLCBj
bGFzc2lkKTsKIAogCWlmIChjbCA9PSAwKQotCQlyZXR1cm4gTlVMTDsKKwkJcmV0dXJuIEVS
Ul9QVFIoLUVOT0VOVCk7CiAJcmV0dXJuIGNvcHMtPmxlYWYocCwgY2wpOwogfQogCkBAIC0x
NDk3LDcgKzE0OTcsNyBAQCBzdGF0aWMgaW50IF9fdGNfZ2V0X3FkaXNjKHN0cnVjdCBza19i
dWZmICpza2IsIHN0cnVjdCBubG1zZ2hkciAqbiwKIAkJfSBlbHNlIHsKIAkJCXEgPSBydG5s
X2RlcmVmZXJlbmNlKGRldi0+cWRpc2MpOwogCQl9Ci0JCWlmICghcSkgeworCQlpZiAoSVNf
RVJSX09SX05VTEwocSkpIHsKIAkJCU5MX1NFVF9FUlJfTVNHKGV4dGFjaywgIkNhbm5vdCBm
aW5kIHNwZWNpZmllZCBxZGlzYyBvbiBzcGVjaWZpZWQgZGV2aWNlIik7CiAJCQlyZXR1cm4g
LUVOT0VOVDsKIAkJfQpAQCAtMTYwMiw3ICsxNjAyLDEyIEBAIHN0YXRpYyBpbnQgX190Y19t
b2RpZnlfcWRpc2Moc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5sbXNnaGRyICpuLAog
CQkJCQlOTF9TRVRfRVJSX01TRyhleHRhY2ssICJGYWlsZWQgdG8gZmluZCBzcGVjaWZpZWQg
cWRpc2MiKTsKIAkJCQkJcmV0dXJuIC1FTk9FTlQ7CiAJCQkJfQorCiAJCQkJcSA9IHFkaXNj
X2xlYWYocCwgY2xpZCk7CisJCQkJaWYgKElTX0VSUihxKSkgeworCQkJCQlOTF9TRVRfRVJS
X01TRyhleHRhY2ssICJTcGVjaWZpZWQgY2xhc3Mgbm90IGZvdW5kIik7CisJCQkJCXJldHVy
biBQVFJfRVJSKHEpOworCQkJCX0KIAkJCX0gZWxzZSBpZiAoZGV2X2luZ3Jlc3NfcXVldWVf
Y3JlYXRlKGRldikpIHsKIAkJCQlxID0gcnRubF9kZXJlZmVyZW5jZShkZXZfaW5ncmVzc19x
dWV1ZShkZXYpLT5xZGlzY19zbGVlcGluZyk7CiAJCQl9Cg==

--------------l5XmQQGS9Ad3RpFyn26aEMqN--
