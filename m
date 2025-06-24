Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E6291C02;
	Tue, 24 Jun 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772505; cv=none; b=TnhLfdGi5PKXULPE0X2prDz5B3Wl2JkhbvaP67Sc61SpotbH6w5geBz4P1/5dIPqQoCzoQWmBLE3tsdyvQoqXvbQEhXGzvcbEluFZxwx6UjRqL/dbSuB8E715OYmAWKuOu7exUS9muiCG3Rxu2hBnV2L6HdSKTOZYkiu6PG7MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772505; c=relaxed/simple;
	bh=ilr8QyCfE8ZkgcKvzvG9t+yXqup+CVbZnX7tdrDKiUU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oUpPRFaof8fTKoS++TiJvEELt9ohouuglEwi+x9QZRHsG84JIFDzJgVdD17ZaIusQAn20RDTIzd9b97Yr8rfLCffA1yrblEI8Xq3aVFqRLfsEnXfd/T/gGixJfqwpqqIYMszj4RZq+rvuEw0TcP3u6ni0k0eKYjf3YXwMwwpuFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anqu1VRR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anqu1VRR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso356031a91.1;
        Tue, 24 Jun 2025 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750772503; x=1751377303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLtIMvBntPZebemDraNox5q771O0b4RJzZvZqb2Y8Nc=;
        b=anqu1VRRGPoJ0YoRfOyZ/1Frig21WaaCoCS+aXGw0eWntu7OVYTtLvxlXPRssvRy2M
         wRaNgwyt1YPuo+hNa4hAFGQtsYw0W4j90Ah+CD6iVMPa5JJ8t3MqjlF4g6pP1gnPEf4c
         17vakgT6l0k20k0qRD2TSBQEGDfKXR0igtUrzXwqwUMRr0E1/CKyAKjl6CFTdd85BOyJ
         p/MovHCaSSFovJt4jSepp4BOb2Hufd0DOP0S924o5rva1ev+wX5HLFMIvfAGREy2DF+f
         YYfmFJhNuDYeoF1d5qb8/G9KsKQPachYZgzc39nszXy1ITemtB3pUqjiBR3plpQmbIfn
         PgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772503; x=1751377303;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VLtIMvBntPZebemDraNox5q771O0b4RJzZvZqb2Y8Nc=;
        b=IQjz9/j57sKgAjuHh3DCFZ31DOnaoab+UfKQ+lvXeLDPZU14OD4LdWwHnCAFMaTVAH
         xGFUo/wrsxibrr81ydOeQy3PQW7rWvxEBiNZN/GkmnXnSkKz6n8AewNuu4OFB/HZgmLg
         86w+1BuBES0Ao3i+pDKd4NSDRBxtBzAPvo50AZsmCChtw6SOtlCF6hMP0EtyLAzMRXTD
         xNhQ3FVSkceQQ1MMB+l8PVbHF+wJTDawuzO2sJiJGXSul+3Nwyd64Emw2D/z5GRVXeys
         g3qr125OqGWJd/i2TilbYb+saIMVidt0XbfagHbkaNcENlBkvdNXZLMvNbFCZ2NIAgf3
         xb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUorZSZjgsS1cJFwJmL0XqxOhi08x5X2WhVCayXX3+ls5g/9hl0e3LqhzJplkIACB/Dgz0+PLgD/bfqFvNT6AY=@vger.kernel.org, AJvYcCXJKTMvERbOHRW/OBlIpUycL1elqFvPmFWS3s6+sXSWdkLF7HdWSZG21kObDaaCW2imOzEAiREnwl/LqKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmsQqSdvx/ba5+4TocznN0yBPhSZk2AEPQs+XSZMCxmlioTeO/
	SUnN6E3rKZttvReT6buRHZiEI6raFix1YnCyepikVcZKfZ5yYE91ofOt
X-Gm-Gg: ASbGncvb5F7bNKpICbsK6FIbjQ/xK2DlY/6tm3DDVx19FeSqJF84RmNa7O4O52pUG31
	InpEeaIJTnM6NNajZGq/EDlh3fWUkFhO2LSqtXuVhy3cnkXbNvBNsDV2lVNoPSb8SmE3p57AdNe
	hPSAQ55xcSgRpIA01dX/pq/eDDXgg1ZPrXTYCuffpj7YeQx5+Vk18f/ZSjsJ2SFjyeIFmu77UBj
	sbyPFRa+xGV9JaJ/3EnyvBvTr6+PXgGf4yXO6HaXBpwvRHQzm6RXgU4Svy9LcF4NOGnqgCcunzM
	dE9eB+jBFuBxvoBI38YYRU6hEbZ0IowPoMzlTGTtyuDMUAKqkf7FW/hpxKjGpGjdZz4KK8O73yD
	dkPGBpkSy8paf8wAPOviaHW9WCJpOatl7Qw4Wadma
X-Google-Smtp-Source: AGHT+IHA4wQdkY9pu5NPgDKAEx4KBIQ9Py8m30aGH51cuZUBSEKdOHrMkZ51fRAHcH8uyzh+aCZBiA==
X-Received: by 2002:a17:90b:2e87:b0:315:6f2b:ce53 with SMTP id 98e67ed59e1d1-3159d8df90bmr23541039a91.25.1750772503448;
        Tue, 24 Jun 2025 06:41:43 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a2f0b05sm14566237a91.32.2025.06.24.06.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:41:43 -0700 (PDT)
Date: Tue, 24 Jun 2025 22:41:30 +0900 (JST)
Message-Id: <20250624.224130.2089845741064711087.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com, alex.gaynor@gmail.com,
 ojeda@kernel.org, fujita.tomonori@gmail.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87wm912sjg.fsf@kernel.org>
References: <_dhT441zoMZanviBlUpcvPZEw7TiwB4v28ONPXSwi7WvEaMg_YJSmi5vRlLVaaUOujF7NOspxR0NYFLOHXud_g==@protonmail.internalid>
	<CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
	<87wm912sjg.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 15:11:31 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> and already introduces pain for
>> others (and likely even more pain when we need to rename it back next
>> cycle), it doesn't look like a good idea to keep it.
> 
> Ok, I'll drop it.

Do you want me to send the updated hrtimer conversion patchset
(using as_* names)?

