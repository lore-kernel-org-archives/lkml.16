Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1E34503B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307417; cv=none; b=far8KFJ+CoEz/OKYjlVOdNfcbfmfYMicvCdybewpFZkMiqPi59dKmKyM2VC36XswEG/txyPl12PgrKiyaAcStmfb7MyuLcMIMq+F5KCKGOUlwMQ26/ctXpxjmEegTN2w5Q+qZiGXw7m18kA1CUDfy1iikY6SjNmXG/8YPXDM9lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307417; c=relaxed/simple;
	bh=lY9Y1px5P/T0puiH7BaGtKHUBDN6WoqTLWKxNXRuM/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqYIxjcg+IaBiiVtpddmPP7QrmBFUYRumUibdL8Wxf80fskQFbfoLdn20OkJDZiWd3JXQ23cmT2oN2fE3gqirCZF9BxPph7xtX0UXIjqvTwsECsXEXwOXen9zGTYMCgRcTRowGnHsZQBDvjNp6gntPPrKZIZdK/O5o3buv5ot1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kkphNOJk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kkphNOJk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2295d78b45cso16168225ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744307412; x=1744912212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFvKBztlvaO+hpuywxVFq1Ch6C+gHqQXzW5kBxcM2OQ=;
        b=kkphNOJkIM3PK9y5ytq7EZKAjnuuZlCqbwdk9/HDnmyvn09DKUPpQcmUxPDMxEUQGN
         VBmZm0I30wEfuWj+teFbNQgf4XaHVXBUykXacx5l3/YJYeQtmxRRt3sMS4j5pgbfBh/1
         yKsOFqyv1Ga5xG0tfvDT85l9/3kVavlgL2zz0iigz+ZrD7bux/MuOGzsBuXl2RH1yE7g
         6T193yNm7ynjZUvPVu4N4lJxKHRV4PdA4ULKjpuEfNyTP8Uhu12jOAL/Uis0F64FaAvr
         t2tPCn/cZlGXtIPX3wGiYNYdpShZ2jMxfoc24CIX7264OCIjXu5KqIdOHsKbxNujCDmI
         GI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307412; x=1744912212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFvKBztlvaO+hpuywxVFq1Ch6C+gHqQXzW5kBxcM2OQ=;
        b=OCBhdP4PnyF+GGMpsvSSXR0fOUAAAVkZ9E9JHpvOkkIbzhVqpDoTGH+O/No7owJ+49
         WB48lE3YcPceRYYzco+PHyMck2X5a3B2YBT8SZ+bPXZRIfTv/3ENhfDWbXKJqIHDW+cw
         X4IVleam8ju8gdR9vf15KL3f/R35DCNgc0oibRGFdaJg+IVvLE4/JSn7zTdqyS70ftPq
         4347NO3WA1ZM8MOJ68ImgPD+ROWc/vGMlfPT4FubOXFM5Jz4P4OqyMyfBer0oF3uidUE
         qvyB40oJ/fi36EODDKIH0V0CgW5st1iFvwd8O7ET/Na9RJX4V2lW/kRJThWGetJsWfEs
         2fzA==
X-Forwarded-Encrypted: i=1; AJvYcCVFWLvYpG8g2S7X7NL6JZudYhvqniUwx9Rs2yu5B5bGm5HGbyUMUJmXrz4Oy8YZiLP94S5KiaUFJXICbvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbtooZ8SiFrmfKrGP9sno+K3cMWGFD1RjDzMecMCkjnnCINg1
	J8ociewMDLo2BqbvrRH5BQTTWxSkj7u+bEWIjKHoV+BAleKFA1pjJrdT5oaamDs=
X-Gm-Gg: ASbGnct4dHA0PM25p516JArnLO/cDt/1KfQVGGT0BqcqRz+DHmfG3czF8hE+eoRLViU
	TVWluL1lNmP8KLL9mVtpuBPTGhe+UU/R6Z37iPaluKk4tnPiIqfRsc7AhWbvw81X40Q+pLnpVKZ
	6S9kwUKi2Wy9lEic8c98YaQi3O671aKtlfXlfs4Yu+L/fCuJMahqbGdli2IxcBnUuVHMzF0uPVY
	HapWofZy79TI4dMci4lStr507bmUXMKM8Det8EK/HF/9H4+570QIMOrKTjipC6fujQcuzjuRcBe
	/Qey/eoEEWo+NfvQefL1+wZ8v6zBn635EmBqsVhVa6mKTIklWtJLyuEMftefmZSnyd7EoxiK8Cf
	VtIpWgMWA3go=
X-Google-Smtp-Source: AGHT+IFQfLjl5b/4pxjR0AKJRtL4njnVrLI7qc5hXSk6wBYhGK6iLJeFS3Z7hjVwQHKFbPW7UQz95Q==
X-Received: by 2002:a17:902:d50e:b0:223:517a:d2e2 with SMTP id d9443c01a7336-22b42c6e367mr57462235ad.53.1744307411718;
        Thu, 10 Apr 2025 10:50:11 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8bce5sm33652735ad.90.2025.04.10.10.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:50:11 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:49:56 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/gExA95AnQzxYmt@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
 <20250409111002.5b88a127@akair>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111002.5b88a127@akair>

On Wed, Apr 09, 2025 at 11:10:02AM +0200, Andreas Kemnade wrote:
> Am Thu,  3 Apr 2025 18:44:58 -0700
> schrieb Sukrut Bellary <sbellary@baylibre.com>:
> 
> > This binding doesn't define a new clock binding type,
> > it is used to group the existing clock nodes under the hardware hierarchy.
> > 
> > As this is not a provider clock, remove #clock-cells and
> > clock-output-names properties.
> > Though few clockdomain nodes in the dts use these properties,
> > we are not fixing dts here.
> > Clean up the example to meet the current standards.
> > 
> > Add the creator of the original binding as a maintainer.
> > 
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  .../bindings/clock/ti/clockdomain.txt         | 25 ------------
> >  .../bindings/clock/ti/ti,clockdomain.yaml     | 38 +++++++++++++++++++
> 
> I am wondering whether this should just be part of a converted version
> of Documentation/devicetree/bindings/arm/omap/prcm.txt. I doubt there
> is any other usage for this compatible.
> 

Yes, OK. So, do you want to take this with prcm conversion? If so, I will
drop this from v2

> Regards,
> Andreas
> 
