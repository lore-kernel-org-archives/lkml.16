Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359130E841
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419139; cv=none; b=hHBNCj8Vb2c/yZaY98cNYEYzRvDgksZ0opK7XUMV1rigy1lQ07WlZuSQnk+UbQ7C4mETWQryZA2TuAx0WLGhAoPvFblbVaMfG8M9NWMQ6JaiwYkjdMVp+5t4xlu9uYRg4/nHbx9wLQFy+zewy6/jqFa3tqSwIkUJed3hkKV/yB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419139; c=relaxed/simple;
	bh=heERv5g/XsTsuXNwTTbKK4BB0Mtt5YAjNxLbnrwgDIw=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=NjTw++ryEs8pXJE2rleKYlFbuiHXkGemjrUkTCiZ8+TMNI8jI4tb3tHbwD61cv4vjRzVg+7oz2CyYo2UKFZxz9JWl4cZE6ne/IfxWbQ1CM+gn1R/CRNdONCP+rdJFbragbbB++jXa6jb3D6KEE01+W+tuEMjlRs3MQyCUJcZ7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1b7zeHG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1b7zeHG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23694cec0feso15625795ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750419137; x=1751023937; darn=vger.kernel.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=us3Sptj3W6iQQ2egH/6NimLpKK2aDaly4nfpdXlFxwE=;
        b=j1b7zeHGl+iyMk1G7Ur0uM7/Dcl+haezVloCSO9GR4D0mRM7xUSoh9ZqGJTUCFb35S
         yMB2/FJLBRUWTXsiHuPYGhKNL/uAOd/Q1WDu8uLnZVR+6KfJ+xe4e/yMNQ8hE86ItR+8
         TxbSAomqWD4O6hTm7oPUhbEOF5AMh+kojTsITbUP75UoSU4GCnD9vTpVFfeJg7zBoXGI
         m8grJAW8LLcYk87kDlstOmXPFPTmJx9GetpkAE6jHKyFRTZcXE6ytpeFURknLE9DJmeb
         fMM6TUsSjs2tR53xO6+iDZci+s7HVH129hLXGpVllaVFCn4qQ84cqPAmKHm1uFozsfz9
         L4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750419137; x=1751023937;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=us3Sptj3W6iQQ2egH/6NimLpKK2aDaly4nfpdXlFxwE=;
        b=UevWhNsvzEnCJuNvu/rb7sJit4JCOX5RrmMdYz0h5bWOxKHYcPXvkCNNnY7mUBxB+1
         NFoXMVQPDBs7jqx1DI+ZIFJzl5vBqZfGnZKObe23kqCXYRLMxkDnHMUS7CN9qmt5O6yJ
         zFptYS+tf7fcwdiMuytGN6YlwsLmwAThe19lT1oKUYI6PPm4aP5DWuQBrF14B6l8d5IP
         BoOPT+uGbx14smy4EOzthdu+t0as4Glfkq8RIQsdVJfonSVe1xJg9wKALJwsdbC2blAB
         3Z7cbNTp+jLkjsNnF1SzX52Dhss5JFrjLXVIuaF8rL27Xp3IIM+Ke8vNrzdexVvpXCYB
         UD1w==
X-Gm-Message-State: AOJu0YyJwI8zLVV40ICa1BXKrk6clIMzKD4bDXILFyJbQVqfquFoWU67
	SH9O+Lra3ky8sBVX/CpWf0BvXysbtHUEyZncuRyDP2BIysPeN7Jd30rnNQ78jhrhlMc=
X-Gm-Gg: ASbGncu0QdBKRVlfmkQ93VMvVGN7BFmDsxSzsGcEoXLEB/E19DGiyQBqnxFrNTfEMFp
	fNAUMa7emO5HQYO/OiaWsiEFwYv8QCBuh29pF/b7aUGzVKWKqsX2BWeTtO9QJYQk6ZNxXf47rtv
	bvYlXPqVO+4FIUgc2NIWsgiCp6q77R6V3uxwdGwmdRB79/DJqfwFy6QoxKtJgi3ciE5TPyLtB8d
	u3FJ9wDuxmFTYeOnAtKQhGhsAMxo1/iKGYHqc4o3Tfc0bPajDWFPVhuh34f98sQN8MSV/Q1eU+A
	0nAmZix7IkfsH8CFZt0v54zHLuI/T49iS1i2E7S2uEYcTW4xKwGB6PBOD5D3gkX9JovjbKOQsZq
	EvnKQg/M5UVG7KhymCzlFesc6vFlXOrBz4aNsA09D
X-Google-Smtp-Source: AGHT+IE54ifv4wCagmDfminedIxUUVCbUSmwmzI+A2oY8eHq+k9CpmMZ96jV4cp2H4s8PDsrM/WXsA==
X-Received: by 2002:a17:902:f64a:b0:235:6e1:3edf with SMTP id d9443c01a7336-237d9878c08mr37269195ad.34.1750419137216;
        Fri, 20 Jun 2025 04:32:17 -0700 (PDT)
Received: from ?IPV6:2400:2411:d5c0:8200:6567:d3bb:9110:b725? ([2400:2411:d5c0:8200:6567:d3bb:9110:b725])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86f8261sm15945685ad.221.2025.06.20.04.32.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:32:16 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------P0OEujdFXvmaOhgbvcFVUG86"
Message-ID: <0edee524-4abd-493f-bbb6-f1ca852a043a@gmail.com>
Date: Fri, 20 Jun 2025 20:32:14 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org
From: Mishchneko Sergey <sergey994049@gmail.com>
Subject: [PATCH] module: Add comment explaining purpose of module_decompress.c

This is a multi-part message in MIME format.
--------------P0OEujdFXvmaOhgbvcFVUG86
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch adds a header comment to kernel/module/decompress.c to 
clarify its purpose.

The file handles decompression of loadable kernel modules using multiple 
formats (gzip, xz, zstd), and this comment helps new contributors 
understand the role of this file more easily.

Signed-off-by: Mishchenko Sergey <sergey994049@gmail.com>

--------------P0OEujdFXvmaOhgbvcFVUG86
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-module-Add-comment-explaining-purpose-of-module_deco.patch"
Content-Disposition: attachment;
 filename*0="0001-module-Add-comment-explaining-purpose-of-module_deco.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmYmQ3MDcxMDBhYTI5YTg4Y2NiMjU1NTMyZjI2ZWMxYmFhMDFhNGYxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNaXNoY2hlbmtvIFNlcmdleSA8c2VyZ2V5OTk0MDQ5
QGdtYWlsLmNvbT4KRGF0ZTogRnJpLCAyMCBKdW4gMjAyNSAyMDoxODowNSArMDkwMApTdWJq
ZWN0OiBbUEFUQ0hdIG1vZHVsZTogQWRkIGNvbW1lbnQgZXhwbGFpbmluZyBwdXJwb3NlIG9m
IG1vZHVsZV9kZWNvbXByZXNzLmMKClRoaXMgYWRkcyBhIGRlc2NyaXB0aXZlIGNvbW1lbnQg
YXQgdGhlIHRvcCBvZiBtb2R1bGVfZGVjb21wcmVzcy5jLApjbGFyaWZ5aW5nIHRoYXQgaXQg
aGFuZGxlcyBkZWNvbXByZXNzaW9uIG9mIGxvYWRhYmxlIGtlcm5lbCBtb2R1bGVzCnVzaW5n
IGd6aXAsIHh6LCBvciB6c3RkLCBhbmQgaW50ZWdyYXRlcyB3aXRoIHRoZSBrZXJuZWwgbW9k
dWxlIGxvYWRlci4KClNpZ25lZC1vZmYtYnk6IE1pc2hjaGVua28gU2VyZ2V5IDxzZXJnZXk5
OTQwNDlAZ21haWwuY29tPgotLS0KIGtlcm5lbC9tb2R1bGUvZGVjb21wcmVzcy5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEva2Vy
bmVsL21vZHVsZS9kZWNvbXByZXNzLmMgYi9rZXJuZWwvbW9kdWxlL2RlY29tcHJlc3MuYwpp
bmRleCA0NzRlNjhmMGYuLjM1ZTM3ZTdlMSAxMDA2NDQKLS0tIGEva2VybmVsL21vZHVsZS9k
ZWNvbXByZXNzLmMKKysrIGIva2VybmVsL21vZHVsZS9kZWNvbXByZXNzLmMKQEAgLTEsNSAr
MSw5IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgog
LyoKKyAqIFN1cHBvcnQgZm9yIGRlY29tcHJlc3NpbmcgbG9hZGFibGUga2VybmVsIG1vZHVs
ZXMuCisgKiBIYW5kbGVzIG11bHRpcGxlIGNvbXByZXNzaW9uIGZvcm1hdHMgKGd6aXAsIHh6
LCB6c3RkKSBhbmQgaW50ZWdyYXRlcworICogd2l0aCB0aGUga2VybmVsIG1vZHVsZSBsb2Fk
aW5nIGluZnJhc3RydWN0dXJlLgorICoKICAqIENvcHlyaWdodCAyMDIxIEdvb2dsZSBMTEMu
CiAgKi8KIAotLSAKMi41MC4wCgo=

--------------P0OEujdFXvmaOhgbvcFVUG86--
