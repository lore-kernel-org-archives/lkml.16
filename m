Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8B2111;
	Fri, 11 Apr 2025 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367214; cv=none; b=XxYT7ThvxQSeDjwcDlpmyeNyYw/Xe07tpzMGuNnUWMBE79v1VGfmGSq2uI/YCqn476prJWlxe3hjWPEL/zXr4AUddrf7JCNCBNfM4GLRZTufq/3fEGC3Td9N1sVOe0WSRykZrHOh2VMmKyqjJNvuyoPa/gmp8whvp6b1a2bIA/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367214; c=relaxed/simple;
	bh=O4KqdYjRC64H8ToIuxhL6xWWnBNvLP/zVgr8FU/xhpY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ocrMvknkPrSc8+7N99KFRqaSwWntJnWQE394PjTs1Cp7nYzRaDDrBEZHL2PqWa/HrH9QIn1zq7ug+70bCMuUSvSOIh2gfR8jsmrPxGlXnsp3KpehVX10AM68aeFky1vM8Y6R+8YJM1gCMliIc03uZw9fOT/C7FK59tpmEdVSVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUJcqXaG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUJcqXaG"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2402998b3a.2;
        Fri, 11 Apr 2025 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744367212; x=1744972012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjuoOar/qHDJlB0wKmDqj4coUEnm9uYJr4sa2p38wPo=;
        b=ZUJcqXaGYlkliE9q13Mu8qTAVxeCJ82NYpxI4Ew6wFW/Jiv8G9VjZSCxXBraKjEMex
         6BJWyI9EAlVmtYZaylVxjCsJtxlTzXwlXnHREivZW0i0KkrqOA1YWFMJnOLwVnxGrqXb
         26P0YyY8ruyUyGeMMa4cEm2CZ0lRe4m9zBmKq8oXislisGN/T3xAwTdkUlyQoEVQDr7/
         R6uVJzvnAFFO4l/6gSEvuxKNUKHr6QwrEpOT5rUTplobljxawCts7e59TLJlQiEgnRGP
         4nUVSOTnkMVi2iLmxH9lmeCP093WunqoSesoDIOphogOmtPq7gyB2FfCZN4DGarbLRI9
         vA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367212; x=1744972012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZjuoOar/qHDJlB0wKmDqj4coUEnm9uYJr4sa2p38wPo=;
        b=LnpT+a5sfL6fmeDpHCRUGLVjZN8cBQbd7R4+zGegBnp6rch8ih1uw8ox8v2FRW/Mby
         fa1ivJaTFqiqn8ArZa0SYrWshowrxMHtDhnuwZIFH+vW6AAlH7O4gehHeMAx1JMjxlzJ
         DGCOSYxNFUVzvgi10YCGAv7p3Bohcf/FsrGZccsSWOq79sBjQr/CrtwoZyJK3FZrN07X
         tLbEm7T2Voak6AixnWaQd/Fglg/U/dF6I5gKSvAByBAmJBz8z8hxdqEkZhTNB3Xd2bQi
         FuNFFZrwH+0/gYeF0YPh2raCfg1ltQgui+wrSSR6ffAXrwsnKoJAUkXP8vBjJbdiotzj
         bnig==
X-Forwarded-Encrypted: i=1; AJvYcCUMeknluhcyprsuqyNCJayRhw6J96dIDWeSR928qjVAISIR5GjvfnxDzgDhnF+wWqaJQLkd4McW6lIov4Y=@vger.kernel.org, AJvYcCWsEqnaTr1zuRAji4DO0W2c0S9LkvlXxZvV25+wkvGYzDI3kCyvfjcoVfktahe3aPvKm8fAC8Kus05+bZIR5AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBqqWlj1Y2waPbES6g7uzG9luk1Yuy8N/JlrlHXfuMW68ZrEy
	L/F5/536drpVMy0U86l5b528M9ehjstcVPaPYj1WuxpKFooivsQ+
X-Gm-Gg: ASbGncsZhU4rCaxYtR0k9oNDv6i58Hg2WNakQyEQBDa4wcDww0DqGXeRgkhbWESAuAq
	I6gc9JXJC0HDfU22sam5pRfLOIjoWBauKDo6qySDHyRMlWrJPZg8bqevQFlFo9bQcy7jMawD1xJ
	sX68sDfrPeCJ24uf5ARemKXW1a4r6rD4xmf5LEtQgmxDuVedshdp8XZIC9RhbrdcRjfvFjI6AQv
	p0JSNGc0xJrWuebsZN0TtP3n6PchU7XMmcEn6B6P+dS9KqxMwF02aS2nyLTOIeSfrttTLoJplqa
	o5dpVGLqPiMBEC3O+Hogs6b0uqySx+l3TwC0JBadL7524RlGRcyjgpq0XffWXAXqkrDTT19UxW6
	MU8mih9D/QXTt8TRCv/j5rQk=
X-Google-Smtp-Source: AGHT+IEWwDnbyVwPFqOVnCdkN/psx+fU+RkZ4Yv6uyoCWCO9dzSq7uhsjoNHIVZn8mcG7IiTkxxcWQ==
X-Received: by 2002:a05:6a00:4f90:b0:736:34ff:be8 with SMTP id d2e1a72fcca58-73bd1261635mr3426662b3a.19.1744367212470;
        Fri, 11 Apr 2025 03:26:52 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62ecsm1170202b3a.62.2025.04.11.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:26:51 -0700 (PDT)
Date: Fri, 11 Apr 2025 19:26:47 +0900 (JST)
Message-Id: <20250411.192647.1837707035806943183.fujita.tomonori@gmail.com>
To: dakr@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 tmgross@umich.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: helpers: Add dma_alloc_attrs() and
 dma_free_attrs()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_jmBz6FBoYMMGyi@cassiopeiae>
References: <20250410234332.153242-1-fujita.tomonori@gmail.com>
	<Z_jmBz6FBoYMMGyi@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 11 Apr 2025 11:51:03 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On Fri, Apr 11, 2025 at 08:43:32AM +0900, FUJITA Tomonori wrote:
>> Add dma_alloc_attrs() and dma_free_attrs() helpers to fix a build
>> error when CONFIG_HAS_DMA is not enabled.
>> 
>> Note that when CONFIG_HAS_DMA is enabled, dma_alloc_attrs() and
>> dma_free_attrs() are included in both bindings_generated.rs and
>> bindings_helpers_generated.rs. The former takes precedence so behavior
>> remains unchanged in that case.
>> 
>> This fixes the following build error on UML:
>> 
>> error[E0425]: cannot find function `dma_alloc_attrs` in crate `bindings`
>>      --> rust/kernel/dma.rs:171:23
>>       |
>> 171   |               bindings::dma_alloc_attrs(
>>       |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_alloc_pages`
>>       |
>>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44568:5
>>       |
>> 44568 | /     pub fn dma_alloc_pages(
>> 44569 | |         dev: *mut device,
>> 44570 | |         size: usize,
>> 44571 | |         dma_handle: *mut dma_addr_t,
>> 44572 | |         dir: dma_data_direction,
>> 44573 | |         gfp: gfp_t,
>> 44574 | |     ) -> *mut page;
>>       | |___________________- similarly named function `dma_alloc_pages` defined here
>> 
>> error[E0425]: cannot find function `dma_free_attrs` in crate `bindings`
>>      --> rust/kernel/dma.rs:293:23
>>       |
>> 293   |               bindings::dma_free_attrs(
>>       |                         ^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_free_pages`
>>       |
>>      ::: /home/fujita/build/um/rust/bindings/bindings_generated.rs:44577:5
>>       |
>> 44577 | /     pub fn dma_free_pages(
>> 44578 | |         dev: *mut device,
>> 44579 | |         size: usize,
>> 44580 | |         page: *mut page,
>> 44581 | |         dma_handle: dma_addr_t,
>> 44582 | |         dir: dma_data_direction,
>> 44583 | |     );
>>       | |______- similarly named function `dma_free_pages` defined here
>> 
>> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Please add the new file to the corresponding MAINTAINERS entry. Whith that,
> 
> 	Acked-by: Danilo Krummrich <dakr@kernel.org>

I'll include the following changes in the next version.

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..bec614ef35d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7020,6 +7020,7 @@ L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
 T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
+F:	rust/helpers/dma.c
 F:	rust/kernel/dma.rs
 F:	samples/rust/rust_dma.rs
 

