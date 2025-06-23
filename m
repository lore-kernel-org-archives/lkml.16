Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525B24887A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680079; cv=none; b=mFKlKR054bJ05+NsB+qqzpQD4mHVrKrR4x2wEgemB8zr9Uyd0Ooc7GNG5HYTNfbJsJxtgc9HR5Y2HcaLwMtJrDpoL7brScCws+Z7jpIxEH2bHDUEcTTdOji6UHIawBPboZJYtkGJQYuDc3Xerd/ybC4VNh1sxnLp00fJf0KKtWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680079; c=relaxed/simple;
	bh=d7SILEwcYtEPyRVpUElTwTKFQ3ODmdUrdA4ue3lYQpY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PRNMmlD0Lvtem1NvFSmslukHfwezE+BUrMBUDaM9YEfTrTS1oZd3qDNPzn2rT4DaHIOPfkn+90eHiz1Qz3UY1yDwWG3OF4zQtLkfJeWpYHTl9OzdYDQekSz9BP4Br92Kci/pKIzPVRw/T5I+53WyvP07iyNhCimHKU86Rm7cgB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BuElYsEC; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BuElYsEC"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso2350978f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750680076; x=1751284876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXBjAJSsgTF5DF8QdVVpRmguTMa8mFGOZ6NYbvvI8cM=;
        b=BuElYsECiHv3KjWTCDz39+25w1lDQjSfPqDE+6mlZhorin1Nfcl1r774c1+9GLk7NZ
         tRswrwYj4EQSI+1UMJ+VbgltW9mvnM+DERfPCjy43KKZkMHDXEEp7r6mDG+flVcVO5fu
         apznNqnY+v8UT8EQQJM0WsUp9Yyuh1O9npAJUv04AWfYAFOdIi3j7R63z4FkHRzo8lkv
         yxjRmVW3JFp3UAUTOGXnkPg+WK7648vrRJtcYodd456eUlbeAfPMHtZ1oBON0014APeL
         Q25SOKn0zkSDGSLXmTl5+i4Nvcspt4MUaaAS1DmP7pruX91eomjGf5tohS6dqmP0OqNF
         EDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680076; x=1751284876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXBjAJSsgTF5DF8QdVVpRmguTMa8mFGOZ6NYbvvI8cM=;
        b=sMGW3kBPyKBLkSue1f4L908XHz7NwqB4aE7NF8xHdb/Xcn9mR8E1pu4Bex5wNV8+2t
         DyqkbcEWgUPPiqHk6DO5h1tbsouSfl/kvq64GDMGeVLw42TkaFVytUwoMXIAy3QQbYaI
         RmgjwndKtikd+axbgaFuspxGdOXiStBBk7I7/5vJsAcVHZcC44MviPRpAVITBkuunazq
         NhQw98x8SwKrliejXPWE+Gaj5+oON2PXXnMhGuOs6oOyD9jqynJWOvjUcLoEk4cYDVEj
         QM+xZgxOqCLJcSnV+b2CCmQnI3EJZAXxhTXJtLsBwjcwujPT47zZvqBv6KJZ2IiUghTc
         ATDg==
X-Forwarded-Encrypted: i=1; AJvYcCW520K++EmVPVKRbGc8CoZH27L6ICeobU3cg6VUIUCQ/K6IpFXlR7gC1ZB29LkvhqamzNiumuOfCWc6Lzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYdWVGt50dhtGP6OLdoI4xDuqxU/1qBH7mw7hSNE7ioE3xtFtl
	bAT0rUTUp7AmPXO9YhNv9YMIxotGaq47cziVv0H0NHOTqBp/T+rocV0r5xCoMFvgtkpTBgABQrX
	VXPsHUqW0swqfX75cag==
X-Google-Smtp-Source: AGHT+IHs0W4TxDLErHp60mYQCQGaYXzhOpZPwSd1MKl0ZCrLAjSy6eHDXtUk3W8HjaouPiHhipd0Yguq4kOC1w4=
X-Received: from wmbdq13.prod.google.com ([2002:a05:600c:64cd:b0:43d:1873:dbaf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:5c4:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a6d12a722dmr10276774f8f.21.1750680076403;
 Mon, 23 Jun 2025 05:01:16 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:01:14 +0000
In-Reply-To: <20250622164050.20358-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250622164050.20358-1-dakr@kernel.org> <20250622164050.20358-5-dakr@kernel.org>
Message-ID: <aFlCCsvXCSJeYaFQ@google.com>
Subject: Re: [PATCH v2 4/4] rust: devres: implement register_release()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 22, 2025 at 06:40:41PM +0200, Danilo Krummrich wrote:
> +pub fn register_release<P>(dev: &Device<Bound>, data: P) -> Result
> +where
> +    P: ForeignOwnable,
> +    for<'a> P::Borrowed<'a>: Release,

I think we need where P: ForeignOwnable + 'static too.

otherwise I can pass something with a reference that expires before the
device is unbound and access it in the devm callback as a UAF.
