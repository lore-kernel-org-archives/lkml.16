Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26351F17E8
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650859; cv=none; b=IdMZsJU8y9Szrd4uCK6OdDhLLN2q5dYTORHlLKTnV+KtI1bnai5/xV3/VXwDed3YVYKoUCt5MYJd4VohzFezRL09OAcQyLwfuqvAbrb8W13muU0xzLxUhkZ8XZdcFNIcUn9PIrTBPA3NykaclOz6Qk/oEwx9mNLEEeogToRnsio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650859; c=relaxed/simple;
	bh=OCiXCgXTsdRzlcaZtWeBhlKDQeWUe+XaeEuHpx1+3FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/d48yiIzp5em1YUy1zkpKK8QDG1VDdHE+MwhPUAYD/pmAPgLj1ygs0wAjGQh3ixqRTZlgEi6U+6/LLCHs/VJ4OqVvlWA8KST4PC84IBbq8xdOibBiJnrqvutkHsSZesgL12DV9cq1od7KsiM+pxi8iQGHP4vL0pGU4xtF9RwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ahtPnSJ/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ahtPnSJ/"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad563b69908so168513766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747650854; x=1748255654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OCiXCgXTsdRzlcaZtWeBhlKDQeWUe+XaeEuHpx1+3FE=;
        b=ahtPnSJ/Gc1ZTkiBUqsk9zNazJ3dOZXidTo+KO5ZxwHMK94OTuRYK8qSteP39a3ElU
         eRLLPo87GjdqptTPhEQXCSa/nxoJRzcNoXKxzc8kN1D1AGSJPTMLspsmkA+e+P1jHXwe
         khCwJiHEOR0hGahag+CxmDvNEh1N/UZBOasRuLsGAHn4p9/GqtvHz5lwpvNkGL8/b2Hi
         Xwg8joQWcW1hw/DNiex3aac0bGEZ2YdarTWsPKLGbgV5XnC0g0zuwZAyt8z9LUgcvXeT
         JjbkDdFKRCWmHlXYmBfBSmD7GSOSmtAblrQbzURH9d+JlCOUIChd/u5acZVGo1lF4bvD
         C1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650854; x=1748255654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCiXCgXTsdRzlcaZtWeBhlKDQeWUe+XaeEuHpx1+3FE=;
        b=MrJC90A1q0ituuwK9RR3QabNH/zStWxJ87AhrSUuVIOD3gjom4o51LngXTYr0/iH5G
         EEVx5GwBEKe6mfRODAOjfkVEu6XzIS2ooVeokWiDLYldtEMg6DNdAVPIfg5938hh4aMW
         o7GF4M5K9ns/tetfnTg7osDQSOqonk2G5hJAXtVSKbXfPW2ugTjp9O9Tsuo/lQuCNXJt
         3lW6Gwerz3GsCJ9ZEl5iSoSCFlzduevyTTGY/JJCXxI32jwJV3XoPewSjz6Vq2E3pzHI
         FOXwOyoXJORkIJCyvOYczEHzrARQ0k/XD6sgAimHshlLz+u/km6HyVXc7beJUcMA1lCM
         96jw==
X-Forwarded-Encrypted: i=1; AJvYcCUtGTL0Bi7HFdaIp691IDeWlmOtz8nEiEa9wFjpk9u10BbsaACmHqlxZ7woyBAo+xWQ5e5eD2/0YqCNnH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5k45MeeEtQIcAYPquq2Ll8RB9CENeNFKUrTrqOkBzGXHU05vO
	nGYk2S8DpcU76GH++wXpRN8YfckI1WvxT7KqJdImKxu7SZRTFEx3T+rjKyxYyhTPzGi76BcuNne
	rzXKEVD847TUwdtuFU+xnulYmYeB+1iRZCoS0p4HTgw==
X-Gm-Gg: ASbGnctbnr4vAuXBouBxmtqfTEwBBj/sttbHnQro/PYGf9kbrqqBVojhtHS5/WF1mTT
	/MgvvAhO9fZt9ZvLNYHO7RIGHa6jqf/klC6qm/sb09yUfgEwMXQphss/NHedl/Mx0MUDK1qb2Vc
	O6I0Rx6sANo2dQSVVuUzAN1LPJ5NnMLjQ=
X-Google-Smtp-Source: AGHT+IFDp8A2zyqmQfoHj5jH3cPFOL82cfvhbT89hIH6TA5DLkVoMIRPLMREfOyoE29O/ZDFknRlG6y9JUGlUCAi8RU=
X-Received: by 2002:a17:907:3e16:b0:ad2:3fa9:7511 with SMTP id
 a640c23a62f3a-ad536dce687mr1138427866b.41.1747650854046; Mon, 19 May 2025
 03:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514131240.3343747-1-neelx@suse.com> <3c08a5d6-bf17-4a74-a889-b1658a2a75d1@wdc.com>
 <ad599778-43c1-49ae-9662-ecd5b79292ca@wdc.com>
In-Reply-To: <ad599778-43c1-49ae-9662-ecd5b79292ca@wdc.com>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 19 May 2025 12:34:03 +0200
X-Gm-Features: AX0GCFvyJrl471zarGWZbjYduBBOoR_Tqci57jCpNqeeLfhsT5ctT_BHaSCe-gw
Message-ID: <CAPjX3FdLkt1DCmKkZDQvHOauGE1m3dgjP_3Jt-kHq7FDpjOzBA@mail.gmail.com>
Subject: Re: [PATCH] btrfs: btrfs_backref_link_edge() cleanup
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 17:48, Johannes Thumshirn
<Johannes.Thumshirn@wdc.com> wrote:
>
> On 14.05.25 17:47, Johannes Thumshirn wrote:
> > Looks good,
> > Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> >
>
> Hit sent too early sorry, I'd also mention in the changelog that it
> isn't used outside of backref.c so it can be made static.

Yeah, that could be mentioned explicitly.
