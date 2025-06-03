Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F35F18C00B;
	Tue,  3 Jun 2025 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957476; cv=none; b=nGkCMj8lQi3e0y+ahFeIbHp20h3x+at/lDLOTtVmvhT/R7izTEL5ZudVyxk2W88+ltVeFqMWJXW+Ov9UcmT6ZdNDn0mmVtS7ddqDEXPNScznmHYSzLvgq1Jn15uP9VhmQ/9rgSBiZqwRDxNVUoTFjIEn29YQTQGwZSIc3MWCupk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957476; c=relaxed/simple;
	bh=4M38nY14Zk4uIT4KNRMaOqbkR6WTrZ0EgcH/VHetF+Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dio40EjBZmQd7WTpww6J4ku4gSspWJFyCbIolYd+47dv42Dgy3NEPUaVfiHNKf117URiPFvaVyTh/Cpd/hChb9W0z6UZbwtH9YXClyRrbfgrOAH61rFnepz2uJVcTQv5JnK2iJ2+fdkELyIwcL2wskteWwcLR8psfGvhibQfW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXkXnMfT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXkXnMfT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e16234307so46450885ad.0;
        Tue, 03 Jun 2025 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748957475; x=1749562275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCsykEXQA3gGGqXe33kKDyL1+M4szlXxFg36Pt4llCQ=;
        b=UXkXnMfTeemBI09TBxLN4R/FG372Kjw+dxo1bMyHSd0A4KFeA3l2AkWs3EURtB/l5e
         pYEo1TbDQQ/9SvKB/LHNhXwmFnDbDblaZr67XwnWsGm0sU6b5uSGuT0py3zgR4UDoenA
         JiHW7TWuRL0oD/3g8FgUPobcC18t3hqg3NDBMhIenLZi8cRIlBpBC23CfzTpHW9M9p79
         60ZhH3KJqp8omkHkSGMOAZepRKUd3CRiQJEfMiN3tvgkx495mlqlT57K24/vJWQ4+Q+D
         K2P3exXLE0he/JawW7IhjhR6I5Th9VGNxNmucCv4rdtNZb7bnhOKR5yNmB4oNCxbYcqj
         htTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957475; x=1749562275;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zCsykEXQA3gGGqXe33kKDyL1+M4szlXxFg36Pt4llCQ=;
        b=gQm29ZGna+YV2XDQOmAL31L2EabwzyN+fYpAKyPI2y16LmvOZUgbfJiTrVH1zHYDWv
         0JnCr/2hjnN5LCPgDLiw323nwdSMcTpD3BfYHTwThzFIraZRxwMSrvd3TQ9/Z1x0YlgA
         IDneU2/xJlmSCAT8tkze0tc+/6NbZ1HFGeArmRQx+pjUHv2fagezydVrCkbx5KjBCMu+
         x20kUmOOF85lwYuHxy0PG2hEdUFLmU4/k+0pjSyk+hVgW17OiBYg6eqbSmHPRmgxgG8a
         TaXJMwbyHjsRtkuDx76N2NwbK8Oi86Gd9OorJDzdLVR/NqTD9YjnEkBsB69ry+JrgZIf
         vBXg==
X-Forwarded-Encrypted: i=1; AJvYcCWx9HJvXTFEuywa97pR5n5DDWyPsDt/G2JkP8pI015eBWUCNd5mzsjdbnp7ZG6AJgi50Y0F6m26BKbOwTQ=@vger.kernel.org, AJvYcCXLGmQM8pWmHNaLHkKfZk2/ILamZv7TPiTabWZfy5ME70sFIf7MgfXnGJkVDnfVc+M72yz0gg+6RLIrFs7KulY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhk80W0EQDICHe7jpCX36Rvtp67gDQR0HU8ug1bWZkQ5ryXQYT
	gQ67rVm6+mCyRPgYybncr6yfJK1glYRWcLc3fXSXJoV9Qnli5KKha/LK/71XRJkt
X-Gm-Gg: ASbGncuF3TNkMArN9mkQUesacFDgM2to3lVum5eNA1Z9hXiL91dIfArHgZKvv2BZEHv
	UOPUp7u4xEuqtKBl8j/o5pK2w5ibXTzqr2AV5wlDVDUXZW4IYk9THBVKm86O8dCVG8U/qe80b9y
	jFMvImJUTej9scNJurfWDQZw4v9TGsDFf/uDLUPJmfdxT47TvUKBcO8bLbWYgCSopwYbRpU5ErD
	wqFuQv2xLz6VFRiVi+XJWIF7oiN5q1l6Rq4hM3GsvQt8B5JQRmTs/artGFInkpMNsEzMc4YsiQh
	WZGaI4pLiULMGFyYGSGeJmfHwK5cl31rtrX+WBZrzyWgoWzAfFSYXfALn2F/q2eobf3n9KcX38m
	cHc5QxYrNJCszljSAEwxn2NVGq4K9sPGp1g==
X-Google-Smtp-Source: AGHT+IGPnYH7ig/dELvu/tvaDE6VqviOSLWl/L6Wgl5h0diS8DlJPtnA9Bpqq5UdH9AidfCPbPdlpw==
X-Received: by 2002:a17:902:efcf:b0:221:1497:7b08 with SMTP id d9443c01a7336-235c9b52d4amr30337935ad.23.1748957474675;
        Tue, 03 Jun 2025 06:31:14 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdb4besm87281045ad.64.2025.06.03.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:31:14 -0700 (PDT)
Date: Tue, 03 Jun 2025 22:31:02 +0900 (JST)
Message-Id: <20250603.223102.1013545444814279294.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: aliceryhl@google.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, boqun.feng@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, tmgross@umich.edu, dakr@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] rust: time: Change Delta methods to take &self
 instead of self
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87cybm72ud.fsf@kernel.org>
References: <Mt0LwmRyNV7VeUvIiRpECX8VzX1D-BG2wI48N58jht_p7RwsCKlrAM1nXjlqUdVIe3cXdhia_xjlVOav1TikdA==@protonmail.internalid>
	<aD1fgizC4FPT07vt@google.com>
	<87cybm72ud.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 02 Jun 2025 14:19:38 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
>> On Sun, May 04, 2025 at 01:59:54PM +0900, FUJITA Tomonori wrote:
>>> Change several methods of the `Delta` type in Rust to take `&self`
>>> instead of `self`. These methods do not mutate or consume the `Delta`
>>> value and are more idiomatically expressed as taking a shared
>>> reference. This change improves consistency with common Rust practice
>>> and allows calling these methods on references without requiring an
>>> explicit copy or move of the value.
>>
>> For small values that can be freely copied, I actualy think that using
>> `self` is more common Rust practice.
> 
> Besides best practice, the value will pass in a register. There is no
> benefit at all from passing a reference here and no improved ergonomics
> from using a reference.

Yeah, but somehow I thought that using &self is more common practice
in Rust.

I'll drop this patch in the next version.
