Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4F123C8A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067250; cv=none; b=WMzRLsA8yMCCaTxpa0Nwf5egueXaYF/oAJPVGX4tnZdSncxlyv2Ck+oXOdLJMb+8kYDfzAo644nmffLyWOjXURA9XO0X51XUEJDKHTVrubQboHqx0lBqAi0Jbf5x7wwqyyFHAOTu139l2AlvD3k845BP9KPohGpcJOYJeSOuB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067250; c=relaxed/simple;
	bh=J2u66nb+ZRnekPNZzRKWIEEdjXCW8XvffK8/9kLcR0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHfuZnYoZX7oM7insm5u3H2SZNZw1iHtptZwNQBfHRa+mklylGUIch2EREMVkzT7Uau7IcAYn03/xsiqWEgrqpkA0eC2jdDT+VIatKvMlqpB7Kj4ASNAu7d9WNg4bhujR5wP5k7uTZPl+leqF1jvh06AZkVJuaond+kSVXREBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A70uVjpl; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A70uVjpl"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so32997105ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747067247; x=1747672047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=A70uVjplBv+wFWsd/jSj5yauDdVTs+6S/1N7+wMeIzVei8NkuzeTk0wpvsIFNd20Ci
         rzrnc9PPkMk8m+rO8p5ku6DJC5x4yXsllRltFpj5DM+E002l+orWuawQtJTiKImziyLQ
         acDmyrl6cpJnZLLFXklomezMuVOdlhud/ZkLrrzMy4HNGPC7mHe1qeQ2zLM6/LNr+lSq
         JKHs+5YcDzRYUO2JVOH/LCMLYOJAd8jnne7eI+A/BAMa1XZlPEnuLLkW1411S/rQsaHV
         pw8Jlk/gdD/JqyhKV9tCPLlFyM6HniklbPw4xVmc4r9mnq9RB3mwe8L9IIz71hj/2yb2
         j2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067247; x=1747672047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=vtjuCjQevO2wjYu/ZfQvBQSM8rdLGZjJcE4wu8ddym7mbaHXG6XhR656Q3gDqs57Dh
         i7FaFltJFjYTWx8Q5fPUV+QSTq7P1liVH0a53NC07RROGNlaX31BI4VWRAKyeO8iseS4
         6vIcpAZyWCMoT1yO8T4Yxic2BiP3dpfsrCDgbbU7+oOR8bsRGcCkc7MAIDNWFpFKt1Zv
         E5vJ7zTmOgwQlZC9J9Vom8klJNkSmrInsfa5/FyIO18WKWYZmNpPvK4AbFSe9AawNpz7
         rU+aRycUXzjBa/V7NkYeVy8YvK/kLBPSCtS5L/ZXq4I06ALfXxahP9L2hqe+S4I/ItF2
         M/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRL411thHqTA0NxtZ6cNHbc47nYXIxC8sb22YUrCtr+zxCy8NiYkMQnzccNdvwdWyAUEZzHFfttZXH5rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP8dqfk2Sbs/P3el3dBoAe0Ph8lJafjYmJgnMgu+s55ZOTA5J1
	b4oMqD4E64JI82flM4lBIklFCRJPbhtMw6k307Do4pK5ljcwHuRe/Vg5IQCQtx0=
X-Gm-Gg: ASbGncspUxiQPZUSgZ4F6Es0ZDScvGCSDE9u6h+q5S2BoL8kGNmze5ytyleBTaPDPRh
	APOpnCNy4JwhPp2XXp5snYBAXmDXienRId9co6SnAT/YDgmRDbKqp6ejGSidEryH5pr7/eXitFc
	9r/rU666L8P4J6bvRudWv9ay5YUgDh/y4cHQzBpcHmNd26D1e5+ajCzyIsR+qTN0AsMiASMoqbk
	C7ebEfvv17auqV7to7noevWyJaEBF5kNWl9Q4Dxh0Jt2ZhNIl/1y+R8yv15s9H7Tgcxz/S5/KRc
	7xo5FZG54Gk0UaoXAsZxEbay3+GCZ4+RdK4WBJOzrg9ih32NFqUZ/BBEcvce9s1mnVL++2Hq6mL
	dS8HBzmUIx6q/u4ka82Vk9WsCtg==
X-Google-Smtp-Source: AGHT+IHMljbBOih9XI5ChNfY5x9ORAxK3ZQZvd0UNipzv1F6zPCMndWOAl1ZZJYumsZfCVB/PanfHw==
X-Received: by 2002:a92:cda7:0:b0:3d9:66c7:d1e8 with SMTP id e9e14a558f8ab-3da7e165314mr150329395ab.0.1747067247243;
        Mon, 12 May 2025 09:27:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2a9ac275sm1503877173.80.2025.05.12.09.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:27:26 -0700 (PDT)
Message-ID: <5674cfb0-fabe-4b58-98fd-8479c4d3ff79@riscstar.com>
Date: Mon, 12 May 2025 11:27:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
To: Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250509112032.2980811-1-elder@riscstar.com>
 <20250509112032.2980811-4-elder@riscstar.com>
 <20250512135429-GYA517867@gentoo>
 <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
 <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 10:46 AM, Philipp Zabel wrote:
>>> so I'd assume the underlying device doesn't really care the id?
>>> but with different order of registration, it will result random id for the device
>> These things are identified in DTS files by their index values
>> defined in "spacemit,k1-syscon.h".  If there is a need for the
>> assigned device ID to be consistent, I'm not aware of it.  Can
>> you think of one?  I think all that matters is that they're
>> unique, and this ensures that (for up to 2^32 PMICs).
> If there are multiple reset controllers and the driver can be unbound,
> it's trivial to provoke a collision by keeping one device bound and
> unbinding/binding the second one until next_id wraps.
> This could be fixed by using ida_alloc/free to manage the id.
> 
> regards
> Philipp

OK thank you.  I'll put together v9 of this series and will use
an IDA to set the device ID.  Thanks again for the explanation.

					-Alex
