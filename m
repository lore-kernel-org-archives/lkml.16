Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4E852F88
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738213101; cv=none; b=W7yO9iMdycWPSJUQLhEcJrAXhQmaKpKJA4PYpQJYZ+2E9NQKB+9pjFiaMV2nmPHmyh1DDkaKeeD+x9AfFyi1C/T6BgC76I8F+o6d53jYg3FBa182XAxyIQd5TFHXDM9KjhAjXQnhY1bpEVs8lzN6KMyXlKS/I+CI1eey+lSyD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738213101; c=relaxed/simple;
	bh=MKUSs+HYsIDDz0bOcM/JRSk4kuQYkVAn0CJXFl2q5xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laMYdFLoVul98hczpCH93cYtS3R1mC8HlUrBLBd/FHXhmsOS1Rvv4jN0f9/eZOwVDhICujltIT6eqXWP3R2BAficsOoYbx+mtq/tNEoAdsIh8jHw9RV4g79iwJl9Je/Sa9GSYYD52WfH16PYF0c0VLcICFvqLKzIRN8HL3/K5tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZ3ptfxc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZ3ptfxc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216401de828so5680445ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738213098; x=1738817898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeFAClo/GRnpnoHmOXhQ8WOtII3WuA8AKf+fEiZpfXQ=;
        b=VZ3ptfxcjw/XLwZKVIw4Fvrf+4kv0NvyZeT/jc3W798tSPXya71/DluFWmZBiYvom+
         OQH7+i8SIy6v5pMm+/0E8vC0MDTsb52Y/9t5E5LwSb+4BXCtyaiJLtdiS7r1Bh/d4aPT
         UQ4syvs1pI8R0Z8H7QBopEq5UU6BsjATA+/eXe8jFcHGSntUj7/smrNWi6gvq2wdbpfU
         aqgFLm2NnBA0hUknOZm3OqOvMb+TLHmNhMi8u2hlR6WfZZpXPl/eN+HMktCcyIiSTsBr
         MSGRJfHwiHw5wiAi+gqe8ywTKIgsa0pXj/i+YgammTYrqCeavjKDSA4la9oWq3UwPmix
         oIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738213098; x=1738817898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeFAClo/GRnpnoHmOXhQ8WOtII3WuA8AKf+fEiZpfXQ=;
        b=enlyGxzzyBB0xyDNTzYX1T37fmijuDHcBV6BtyY+fvMTCJ8SBykAx0t/N2SqMzrcBH
         8Q19BgqTnNb1opzzyoEOsg9IiT4RrCwa4WuM+Ec4fRCVRaXEKqbjxVOeYjP+Bx18G74w
         q4snkGSKk+uBX8Q90r+ZlacM9fsVy43l9bYXmYE3nacJMVCkpzJ1YKVT2HftwfaTU8GR
         3j+rH41Wp12+bAIgAPTjz+ZarBKT6qZ8+yXdVSv8Pa5qSFGl8bkbUYoY35zOWqFSec8x
         axbUKL3djmpYnF+ks2x0mFu6y0V3wDgufwsvgCQtWoxjVz1XftByYbrPsKMfWHjk+J8y
         nd6w==
X-Forwarded-Encrypted: i=1; AJvYcCX+exltNOC2VeIdbVEUfcyXqkH9NdTe/ppo3iiRNgDWFLgE6JwI83J7r7nzBfGxUbrwSTIZiXV3vJKglPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyon5o5YjvdzvHakp2ftmxmmLgXmsqeWX9h8erN0Xplno+G6mS2
	ucAojydE4unp30d3MggtxH1D6IDU+RqTkClkEI6yG8maAvkdyN04sOoYuAelHRo=
X-Gm-Gg: ASbGncu/IM8AKqSZ4mtf+5d/GNFzl9j6rBBEylUCrt3mz/hyjo1NDs3BYUx4MEn4yE2
	9LPnU9JJLZERF311NegRuj3V0kWpEhCTPu+lR+pXgfT1NUm01PDkDI02Glta8ofpJLYUvrQWyZ9
	23/fBJeBdPvbHEV4OqSVFu7f7hQ4VNVW0TwMctzUm5rBXUAlIKMQ+0SAGIOoDSOwORjlD4mB1vO
	VMAMD+CFs2ctmth3iQzEZfxXzm3DejJVft9nRbqOWSzKcVAADriXyWF04jynWbVKI82OEo4M30w
	32o+HmgU6R4PQrvRHA==
X-Google-Smtp-Source: AGHT+IFc+mkM3u7DrCjTmTvkjYFQF/552EVImTVoRgjOM4B63d3mf/fH/ik7UoquQ9a318LnCDssxQ==
X-Received: by 2002:a05:6300:44:b0:1ed:7540:45e1 with SMTP id adf61e73a8af0-1ed7a5d54c1mr9431995637.33.1738213097717;
        Wed, 29 Jan 2025 20:58:17 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794bcsm414717a12.51.2025.01.29.20.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 20:58:17 -0800 (PST)
Date: Thu, 30 Jan 2025 10:28:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anisse Astier <anisse@astier.eu>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: macros: enable use of hyphens in module names
Message-ID: <20250130045814.ve2jsdi3wmzdlhbw@vireshk-i7>
References: <20250122131812.466080-1-anisse@astier.eu>
 <20250122133952.501055-1-anisse@astier.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122133952.501055-1-anisse@astier.eu>

On 22-01-25, 14:39, Anisse Astier wrote:
> +    /* Rust does not allow hyphens in identifiers, use underscore instead */
> +    let name_identifier = info.name.replace("-", "_");

With CLIPPY=1 W=1, this gives:

warning: single-character string constant used as pattern
   --> /mnt/ssd/all/work/repos/kernel/linux/rust/macros/module.rs:186:45
    |
186 |     let name_identifier = info.name.replace("-", "_");
    |                                             ^^^ help: consider using a `char`: `'-'`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#single_char_pattern
    = note: `-W clippy::single-char-pattern` implied by `-W clippy::all`
    = help: to override `-W clippy::all` add `#[allow(clippy::single_char_pattern)]`

warning: 1 warning emitted

This fixes it:

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 1eff30d2ca6a..2e740bbdb598 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -183,7 +183,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     let info = ModuleInfo::parse(&mut it);

     /* Rust does not allow hyphens in identifiers, use underscore instead */
-    let name_identifier = info.name.replace("-", "_");
+    let name_identifier = info.name.replace('-', "_");
     let mut modinfo = ModInfoBuilder::new(name_identifier.as_ref());
     if let Some(author) = info.author {
         modinfo.emit("author", &author);


Will include it in my V8 now, unless you have any objections to it.
Thanks.

-- 
viresh
