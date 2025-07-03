Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81C52D23B9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532299; cv=none; b=rZwpTP/LxNiebpt5stkJ+Fmn+8jhSl2OgfteTcAGKi8kJJ4Q5HnzG9f2ZGoZFVYjY575k5KIfiaeIA9H0g+7iV8yceRQJYkYHKDhpISOmC9zJh7WEZqjIppkVsg4bAwdc9iS+mQWgEo6gvwNrv7Jecyhy0ae8ZIGDX09+229r+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532299; c=relaxed/simple;
	bh=6gaKodRI80WQO8fQlUHCc0R+9PKjGGkDa55qKeWpLes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tbjIp6MFzm3U5Jz4nVNhuA6kyfEUVV6XTsDRbay4PYgsD5urbmJBLn46tISwjAYgKzxS4ANQuFzDURi9xcO+ZX6AhcgpFtn8iavKBegAUpNrXBesulgpoRLKdXt9s3TcfwGYXxNbtMHcolE6cT4wcdNJUfk02ed6I2KpW8vPXE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kM+MN+I7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kM+MN+I7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so4955473f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751532295; x=1752137095; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCaJVrU9vvGCv3HMW8UcZSchVxJ9IX/Nuw4VRhiVqcc=;
        b=kM+MN+I7CqOHwIeYYPBXmJJ/+tvg7clLy1DwG9LVrz3vtvKK6DgxjKigv+ENBAM9Tt
         MCgZ94TYKJAD+Ye3jk0pA+Zq5TgEMONqEclO62uOpKlYnYMVpgih5j6FjBUSWjwh7I9t
         kNwD8SL4SwN6vOWV4TRe6QKiNvJ+DHDqozhQsg8RgMR/n9nAgEwM9B2NIZylgmxx4BXC
         9/YfEWryw8LuhG5ppfLRpRaEhWKcL0WJ9+ilGWJoWKsAICi6GHKnbYBUBZ4TS//1KmSh
         JJos9y/aaWz/1+M4c/lpDbU9GeGdZA0gz+U4Qfg7kPS3ySueBQqb6jB3WGfGS2CYLhwM
         WFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532295; x=1752137095;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCaJVrU9vvGCv3HMW8UcZSchVxJ9IX/Nuw4VRhiVqcc=;
        b=ZOTZpqq4gec3Yq70VhoIo9dzy4jVklBwK3+z77JoK1mUvSzp8EN2ZsfGBe7A/7yieq
         kv+E2QqweWaRXLV0HHPe/myfs2dO77EfM4vTsdcZBhOnRw7TBrpRyC4YX/KlW7OQu4/u
         BcH0bOotp4XRPsZpVOjMxVfQ7V9WSbem6QaDfsr623AmeDz/3eQg+loUXvQ2jHawt2TZ
         2mBo8H3qZIN9EWAITha+pVxB6EQ4qqZXDnQFLlEb4AwXtvxJ2ihPJkYNHUDgDF0TS7KE
         RriXkDMWkjbxF0XjC+WErespdUCi09O3Pyyk5gcVkwL8Fl5l+yd+hhsA5kTBfAIC1h1F
         QbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs3Ye4YP3gvv4c90AZ8V0Vh3f1z/HlJZVZDZfhlUUbeXJ+JuiinzgptuJG5qAJlnb9T+AgM4a5jgf5qJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTegns0X48BdFIFvgN7FpuP08bTChpSxa8nAgFcKVJRQgnIuF0
	Z7vtDw9idy3WH4uwuuiAVfJXENHpXXuhp8K42XMryImcwWtdIKZe4kua6jsCAF3uiKU=
X-Gm-Gg: ASbGnctGtPK24J0rwI7wi+qPqo6XubYSmzIW9CArM947S14O/n0yhgqIqDiVJ+8ixiD
	SzeXuoDXR7vjTiHgwCOgLCuEwcpbPUEaJCfEn0M/VmHvd1yJtkXg0WHTcYj62Sw4WcjWO2RfseA
	hk23Qcsa/wpzbd2+hPkNJuQds08ZUXQGiPF0XDLgSJwOXCkfivOdju84vzJyvvsJO465vaHFwqP
	hJv4pgeIfbYMFvIygA0wWmiGwQca7F8+D8qAuLBSYO1IDJ78m2mIo2bzAxwErwTh8lq2AezK4fl
	BjKGdVAOGhjOlL60ISDsAqnMlfe6u405Zd6zIl+/3cTxdwvIWOR2JFLFOETZtw==
X-Google-Smtp-Source: AGHT+IF545q3PqJViLJ3tmQn2xNcqUD4C4aWOYfTnAGoUJX7T6e4Ign+bwQdPieifu8Yhl+1ojcvfw==
X-Received: by 2002:a5d:5e84:0:b0:3b1:3466:6734 with SMTP id ffacd0b85a97d-3b32de6b0f1mr2108930f8f.44.1751532295095;
        Thu, 03 Jul 2025 01:44:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b4c:1be9:25d0:5634])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f923sm17657514f8f.89.2025.07.03.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:44:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/26] clk: amlogic: c3-peripherals: use helper for
 basic composite clocks
In-Reply-To: <27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com> (Chuan Liu's
	message of "Thu, 3 Jul 2025 15:56:25 +0800")
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
	<20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
	<27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 10:44:54 +0200
Message-ID: <1jzfdlbr3t.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 03 Jul 2025 at 15:56, Chuan Liu <chuan.liu@amlogic.com> wrote:


>> +static C3_COMP_SEL(hcodec_1, VDEC3_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
>> +static C3_COMP_DIV(hcodec_1, VDEC3_CLK_CTRL, 0, 7);
>> +static C3_COMP_GATE(hcodec_1, VDEC3_CLK_CTRL, 8);
>
>
> Note: hcodec_clk is a no-glitch clock. The current driver may fail to set
> hcodec_clk properly. A previous patch attempted to fix this by adding a
> flag,
> but was abandoned as it introduced other issues.
> (https://lore.kernel.org/all/f8c3b6e7-2f5d-493e-8254-2a27623f0d2e@amlogic.com/)
>
> This macro won't be suitable if we revisit the flag approach later.
>

But it is now. As documented in the description, the purpose of these
macro is to get the easy and repeating stuff out of the way, helping
tricky things stand out.

So when/if you fix this clock and you add tricky things, please drop the
macro then and add some comments explaining what you do and why.

>
>>
>>   static const struct clk_parent_data c3_hcodec_parents[] = {
>>          { .hw = &c3_hcodec_0.hw },
>
>
> [...]
>
>
>> --
>> 2.47.2
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome
