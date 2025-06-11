Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F163EA98;
	Wed, 11 Jun 2025 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658080; cv=none; b=m4qNaiS4JOEzqbQ9Jj3Lw2BR465ziLiz+zpVOAeXcXdn+6Vl2huTIOx6NPv4qGMUWa4Rc+kOJX1tzrAyD2lUy4ILtjl9Z/sSaZSieSB6klCJWjZHebbR10q7mVw8HOKch4DAmFZN+fvdnXHfTEAz0ordTaPuN9wpxJtuO+SUjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658080; c=relaxed/simple;
	bh=BeRvL0huSQIByYWiiwTaUyfrS0kA2j5VE/j5L+8lPGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hg6I887yyg6duyoCK/0JQaI0IWwDR4pMxXfrI6WeD22M+C1qC94J7ymEQfFsUr6wz0TTflYACZLVsGT85VbWucLjAb5iFH+Ja2RRkyJnv1l+986/O5sk897lZWPosVLdEr8mCWnX/TtGbbz55Ay14jUFWSL5H54Mr669odrjQK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuCIlUrQ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuCIlUrQ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fa980d05a8so653746d6.2;
        Wed, 11 Jun 2025 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749658078; x=1750262878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9PxIxBPb4FTyWiJgHjA0BIIew4wyU8qf9TFpFZ2tyM=;
        b=LuCIlUrQamB+dodSXWWfZlzkSg/xQ3frwP++drJN3wzrCrBopMk01TVhI5jUE79Vx2
         Y+ehGqqve7NOMnht/YKDUEzAmXsvHAokncequgqE+qGYDPg1qLmXuFvKwF9hD7h1Tl4Z
         AavHUBJIUIs+HLc/KmKFVTxPh/F44W/N9Z2v0XyZ8DdcMCKuWaIsb2kfOTTYzu0Nig3Q
         bfrRHFkykT1oYjfvPBg5ymxuocGQgV5ulGyiZJFDcv3HMBQNa56NehSco9H31WYMGZ5f
         fTfJFRDR8tJHZFJl03uE9uT+8SBlwcB2t+bzAiC/kFNGLHOOjcFx6cGV3s9Rq7Bqj5Qf
         Xxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658078; x=1750262878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9PxIxBPb4FTyWiJgHjA0BIIew4wyU8qf9TFpFZ2tyM=;
        b=HA6KYcNOinUuymdNS0sFpLbL2NH1loUo8uz74R1vj3Wf+9Pct4V4xEffJ6GscU4ZyW
         Bfx856eIGXU/3BcJflhKbv1Uap/iTDIj0jxWlSaCW1EVh3G2BBS3v9pTQOET9G1/TWLL
         f0cYBzc2E6kQ3xkCEmifRRDeU3PHs8K76Gey1/xk2Chzx/mXs5+d3idypiqvKi3vVryZ
         6vRDynwFTbHqnV78PNY8MVQfkHT3GtagwbiFupF8WsTh7ISkIZPj10YhaMvis8+Stku7
         jl1bwt8hsv/oMRTJ1lKbhhJLj7CCrDIV9p7U1Q7PH/f7W3UxvNw06qB6rDHxJyhNh0O+
         33Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWKT1wDfaRuwFTBcy460W8VSQ8fJUQeydmdOH4BALbD+ZKSm/FYiU1MCa2mlrWpGpYGMMRc3vVLio032FUk4Ao=@vger.kernel.org, AJvYcCWeFV7caIRl8DAHPNSElRaTaVGDkIWjASYwazlAnT1craS/8m7Lq8+i9uvZCkLmoP5229U20eKYVsivSN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPp1ymvC2RK87trRckOv377qCBOJA3ccCqtFjBnRlPlJJwz3sm
	aJc1jCJ0CsQb0GeFCG1lt93zKZ175yB4y2538qcJkHhOhR86NuDXDczv
X-Gm-Gg: ASbGncspjDEa/t2fysHEJefyYPC6jYg3HlOIX0YgL4WlrgsX33TPA9j9wfilfOQfYdV
	RLYziApRihzH6cVFD2BHszxXoa0p6HIOE8c5KBSvgf8lln4DNpEZ+oovUfj34kaARpJgzX6OtDj
	ABCbMIRmNN9kgJ2B4RmvOwrMH6/L9Yel6uWaIlW0louvp7kSKCdHctV1+vuuckXW/mzJwvGeO40
	FQKnSNp4I2HEL2wWGvnZESc9z+KC4MSgcs7EYu+/PygZCmep3QblSMb0hiUVSv1zwBHZvhPfH3d
	kuYbva9kpjJzfBAgzJDvQGlTTe6O1vLgW9okqPGRD0g1iI20qSO6b+dxUb7F08ErpK/2pumgZLw
	+Bm/v2bQ3ItYIs2bKRaXNJtzQUJg4LxGtjiv/lLqfvnrZuconRWpe2EZWRcVHeRE=
X-Google-Smtp-Source: AGHT+IFp+cQyAqIpxaG49u9PusUl0Lfxj+baMxvaTffMNAIBTIHv3+ZWZcAhNMVDCUjul/uBZHyWPw==
X-Received: by 2002:ad4:4ea9:0:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6fb2c366034mr68316816d6.23.1749658077729;
        Wed, 11 Jun 2025 09:07:57 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ab9498sm84187466d6.23.2025.06.11.09.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:07:57 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id BEF3D120006D;
	Wed, 11 Jun 2025 12:07:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 11 Jun 2025 12:07:56 -0400
X-ME-Sender: <xms:3KlJaBUKrP-G1q8A-LZFyd_ShM6pBJG-oDIHU-IOLLb4gvyrVmI-4A>
    <xme:3KlJaBlFoTYHAL8k1PUhWXO0exL90R8nr8F2nvvJH1WqXPrYzgr8o5O7jplBrg5Uj
    Tp2La8GokQNrEz3Tg>
X-ME-Received: <xmr:3KlJaNY5K39zQ16jqaMlfPNBQYvejVpbDF7uNq_xyDe9u8-1Tjde8LORhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedukedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhirhgvshhhrdhkuhhmrghrsehlihhnrg
    hrohdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhn
    fegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3KlJaEVQiSWxoeZ_ukcm4y3yOSrCGQLYdPA0g43MQvKpFWFyCv9UQg>
    <xmx:3KlJaLnvdGuKvphImZd_0cJqYSMJs3Y66tYbmaKlaOl8MIVF7b-Ldw>
    <xmx:3KlJaBfknL1aOdLnVm4jcmCD_K2l5tnGsaJeSB_lHSsvfiIlOI2TMg>
    <xmx:3KlJaFFZi1oRyBxU474CWFWupHAZ0EK3ii5yu0-re5r6gNk91KSaQw>
    <xmx:3KlJaFma8FxJI5FUvVroXoiEKMg09WCLZjNMI8FWRpieRpwHNH2_FcZP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 12:07:56 -0400 (EDT)
Date: Wed, 11 Jun 2025 09:07:55 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/3] rust: cpu: Introduce CpuId abstraction
Message-ID: <aEmp2_-imxCc7KaL@tardis.local>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
 <cf3708ce1b8ebf75adc48d62f7ad72ad29241ec4.1749554685.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf3708ce1b8ebf75adc48d62f7ad72ad29241ec4.1749554685.git.viresh.kumar@linaro.org>

On Tue, Jun 10, 2025 at 06:51:56PM +0530, Viresh Kumar wrote:
> This adds abstraction for representing a CPU identifier.
> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun
