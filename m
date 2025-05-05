Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24598205513
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445083; cv=none; b=L7t5VTC3yEf6WQYHIziQgyoQ0ALWkhCrIH+5xjFJjGIcvRG/KlfQEnp/DLv11xrZRhCCCtr+UkSHi3gQGjtbl2o5KPnNTT5XajvIb6iF4oS4t3suVRjds6ajpE3swY60mw1S/NL5xahhHnoOgvcNQK+AGSqV9/zj5ek+MbX8iFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445083; c=relaxed/simple;
	bh=w9fwS6cZu44DNYyOpFqL2BKnV69yB8QoetRJdK/8OS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDRVGU3BqjlnDUvZCdZ9eBTaOLbcosmOC5qkUSyYhTmLNmGAXgwVSKwp5KFgw8d7z65h0wS/g/cMoRK2h2W+gli3jEogZRNvP2HCyuUKtyT447yxPfhVULIF7gg/xx3/Hvd5y4AdD2TrWgYqZV/FCdj07Dv6UUYDmyKJjv6v8tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I5lyCDBh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I5lyCDBh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso6511772a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746445079; x=1747049879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRNB6+vLHCUHJy91BjZtKAWTStntR0JGDa0fZSyWO04=;
        b=I5lyCDBhgxc6pxi9SSPIJFpqNbpggbSNzAhkE7gNVLEpwb5gapL4ei/xM4vFXgmjQx
         MlVdsWfAmTb93gKT2ux+sAR3ys1Xq5AwKc/UicnL2wtyYI78BMIYI8kA8rtud8hHuhAg
         LGubiOi72g5bVuOdGTf7I45b7KuFrp++cCgdGl8Bc4ENNSYlrFLv5FjzdZCRNpTK4Y3H
         BjBz8AQvYLKOvQZY4vg4RShYf9N17GXSkhcaGqXPTF7XZeV2V8LlXT3qdmhmkUj2S2ps
         yun7+6r1SQ0Q4cV+2cG3aVHd/J2tM5iOy9iSHi46zjyxiheDBf8CRkikr753wUHIf1Fb
         Bb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445079; x=1747049879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRNB6+vLHCUHJy91BjZtKAWTStntR0JGDa0fZSyWO04=;
        b=KL6gqD08nU2SSAbcPj6QD+GHpyHdkWlychafJKjxViHcmTmVG12VFF93CUhTYP0Qwg
         rgeoU94pogHq9wUTJr6X+v6RiM2hxWbncGEitHDjQD7IxKQnJhltIZZY8sPKM66LJFhR
         vfMQefEAHgNdr/u2g6WOo8s2op6Vv4jdDOvmYV/q0lL3LL42O2F4u7CXW8nIdANxI4HJ
         XheTquP+0kf/Jsy8E0ocB4FakYXf97HFm2VnxdyJMwGWeVBntBgiDDhYf1LrdCINJhc5
         jl6SqRRtVwyxYOs7Q60Ssg4IpV3aCkXhmPfCEkGQkMXC+4ghM4q9uPupRawv5EZHnvZo
         pX+Q==
X-Gm-Message-State: AOJu0YxQIZQF5aNdFeZIDwDSqG8eA0+No3i17PdZTpt6pPqkpscG2rbY
	hJgPkj/kuf/Tx/9fQtjyEsikRjMQXusYLmEv0brI6EaHuTx28L82UCedHevPwik=
X-Gm-Gg: ASbGncvvKlq3Vtg5B0j73HdIZADei5G6wM+9wYrA7XNpCt+n3DjooSiyAVv4TJuatQu
	VRLykLmvPViJsm7tvYUaofOpnLR7E/LlARmadI6aG1kam38gUCJY3RuoB19g8sEw3KAhhS0bHJ6
	emyqxXFbgAnDLNibpZxFsWhKN7D6rr+i/JcwAml6IrpVlAuhurz5igUbvGcK7PU0pMPAKrB2EeQ
	E5xjQT33QPEFPqqP6doUIHkFlHr26W26vVtypO0Jz1spZEDRYFJqTXubd2fiAEK+MpySOUu0MD9
	hhn+sCEaxANRHTEp0Eu7a/1q/Ol8vkPIEVsrgXYUj/R8/IH4P+S1kbq8GzAw4w==
X-Google-Smtp-Source: AGHT+IH7DGJEsinP3OZTJtFXljstzm7raDfRWJ6vfdblkKgEKiJdCzP4aM9VSeobns5UBJAdIJVs+A==
X-Received: by 2002:a05:6402:13ca:b0:5f3:7f49:a4b6 with SMTP id 4fb4d7f45d1cf-5fab05c1575mr6000094a12.23.1746445079387;
        Mon, 05 May 2025 04:37:59 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm5519570a12.24.2025.05.05.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:37:58 -0700 (PDT)
Date: Mon, 5 May 2025 13:37:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH v4 0/20] ratelimit: Reduce ratelimit's false-positive
 misses
Message-ID: <aBijFf91NBzjy0kr@localhost.localdomain>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0883f20-c337-40bb-b564-c535a162bf54@paulmck-laptop>

On Tue 2025-04-29 18:05:00, Paul E. McKenney wrote:
> Hello!
> 
> This v4 series replaces open-coded uses of the ratelimit_state structure
> with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
> case with a flag, provides a ___ratelimit() trylock-failure fastpath to
> (almost) eliminate false-positive misses, simplifies the code, and adds
> a simple test.
> 
> The key point of this series is the reduction of false-positive misses.
> More could be done to avoid open-coded access to the ->interval and
> ->burst fields, and to tighten up checking of user input for these fields,
> but those are jobs for later patches.

JFYI, the whole series looks good to me.

Best Regards,
Petr
