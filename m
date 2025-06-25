Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901328E0F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814582; cv=none; b=S9OPcv/QjWlWKi+AY5QxDbT5qN7XVz+59Wl1Ejm8wigY39dxnfJfWzvkTPMQvF5x+fiwJ2esTNQ+NyED/V0/LzQmZO4nrxOqOuy2OE+QtOp97gCq1JF41FfqZHsQ27eQc+tViJEPQdvAKOFhY48iXUc7BcXjFFBK4vtkfGq721Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814582; c=relaxed/simple;
	bh=jXYNW/Ij2FUXh2p4zyxd7pfa7aC6gbLZYMcXGEHW5sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb6HSTtRhM4E4gR4AQA5PJFwMjo1BWNWSgIMtPcltiyNXxwJDgJyPVFZmrBk9r5uQSE6znyVZXvwtbnn4CSEWMvnx2eKClSM20no+EfI9xG1T4zDJCa06yf+3sXsHaoBaXcwJzTdisfGR/wwJJZ3/s6FADD8z5wNFypHHHGuWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcL9sEkU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcL9sEkU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so709394a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750814579; x=1751419379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imWFoXGugAc2vnm1NC7NNna3eatJZSFbb18UhGEcvi0=;
        b=OcL9sEkU6JfEUZResQBcuL8CqkFOEms4IEVKaTcNGIfGZxcAKYUKPM7QrRTXi3HQ+J
         g4AzKZl+6vvEeTSGWxmGCsTZV8Jz/XpyoGA5WSoIOCAe089eShQowQmdh5Z1bR5OOxLQ
         4wYxh0Y8gPd9hy0w72Gf0wUqB0dxfnsUmIUgjxMDzd9QoSydA45gMzUUdblpFawBPetR
         eYQPp/5J3G2ciAMpkR3yrbApZlUddq7I9+cCxbOke+R/Yv2ZLsy/BBj8/jNoMQ13TZJ5
         7Rmc31cQANl0wyi1Sbc789CYIljjWzSW7ZWWxlHtjOGAm7JfTBmXZuzy0kNMAwTnuHAO
         Z96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750814579; x=1751419379;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imWFoXGugAc2vnm1NC7NNna3eatJZSFbb18UhGEcvi0=;
        b=dZ4ZPMcUAenxrv/L36IVZiexO4s1XAeJHU9ErqaZbiHIvugSldhfAQckUmmf03MXkZ
         h05km1CxHCns3b4pEnidIZ16+yMSs20ovxPEpb2AnnFK0yFKFVMCiGf82eFcuTqs7NYg
         3j3IJMST8KpK1NAAE7ew31V41HA1Kzm7wXDEZo6Yzlggn9B1VD6emHLsJ52M4BzDddXD
         ROtOTdN627C2aLece0AO7vBZL3qOPO5AftgtP4Hr8qlT6xWJ7uR0mHiEbWwnTuOfR8KF
         kLuPC0JSVuzgH8CQoD4/6G0PDndCyTCdQdvQVF5TH2jPRDq8N7Un0fJNWy3j1GbEH7cf
         gSKw==
X-Forwarded-Encrypted: i=1; AJvYcCV/jA35T6T4lL2jts8WfVrouPsQggaUieM9VMacs2v67itzTmAtavPxjfH1urNGwBJHZ9kvVGjX27v4sGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqLCwQSnH/pnRgfan1D7jPgeRqtjPwQ+6O/KmzMGPJ3tTo3mD
	7OFqqd/YmnmBbbguV1C73LN2g/CF5YlgdNk4fxOhMyapvt69+UmSpb1F
X-Gm-Gg: ASbGnctRmP9nX6B1PstzuUIwmGdbQA1BpkHTh/WMzja/FKWomOndQiITbfaIUcIWOh4
	7XXEDIYL2PTpmRBMfsr1CbKBlbXX20h8WS5keGSveBVU7F1RvGulfGmR2PzhGs3VxoS7754F4So
	Ah3/gLLiPDZS/CjimsVrUH3G+fLP9TN3JkZpkJW+Thv7DfNOzwQz5f16UcesZaNTrnlTR6GzU1w
	AYi8qrOPUXLelvONtAzWg0z/rthX0HUg31Z8pLlkDDkjjrdlCqPFSASolk8RQsteUYPknLtEXO2
	o6oCkGKWEU5I/Isul2ZZmYXZchon8I13H22C3rAOzcEcXtvmHFKVNIYA/mYjLA==
X-Google-Smtp-Source: AGHT+IGIIRg/ERGGFCTWq4lGahT8XNmX/QZcDJGwzWHz2AOvc1dN4HUZBZ3vBfvW4cUmzuHFUWyLDg==
X-Received: by 2002:a05:6402:4345:b0:60c:3b8e:7e24 with SMTP id 4fb4d7f45d1cf-60c3b8e8191mr3108864a12.10.1750814578680;
        Tue, 24 Jun 2025 18:22:58 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c3ca7b8cbsm1176134a12.5.2025.06.24.18.22.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 18:22:58 -0700 (PDT)
Date: Wed, 25 Jun 2025 01:22:57 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH 2/2] maple_tree: Add testing for restoring maple state to
 active
Message-ID: <20250625012257.nboiu2fqfcwhynct@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250624154823.52221-1-Liam.Howlett@oracle.com>
 <20250624154823.52221-2-Liam.Howlett@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624154823.52221-2-Liam.Howlett@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Jun 24, 2025 at 11:48:23AM -0400, Liam R. Howlett wrote:
>Restoring maple status to ma_active on overflow/underflow when mas->node
>was NULL could have happened in the past, but was masked by a bug in
>mas_walk().  Add test cases that triggered the bug when the node was
>mas->node prior to fixing the maple state setup.
>
>Add a few extra tests around restoring the active maple status.
>
>Link: https://lore.kernel.org/all/202506191556.6bfc7b93-lkp@intel.com/
>Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
