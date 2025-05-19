Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428EB288537;
	Mon, 19 May 2025 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674899; cv=none; b=I2wSDKUBDRisOzY4qjwx4IswDpFaark6WWGhTPvdSlMtKHuvdixp2tQ4q2makeZ6gw2/VJGXZNpLCpYVsHlRsITWI/qTHmNERSkYNrVUE3HfLAmvDxdwefNms/RkyQ4nXM2oMNCFjMxX0+4Ert8NUwanXRCwq9w2H0IShBzfjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674899; c=relaxed/simple;
	bh=dLlmEvd8+t0mf6JJ2OeBFyOC3U4PuZS/Ev9pQVQE2F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRWILDPB0rfV8kgxKvwtwgLGt2VGA8hqRFB0Gyt3MrQQCSGA/IZrftOnCvaaZ+7f9KAZjTyOARNkTRsKidI9Pm9NYwqPHzQYPDjQwnq7M1zG2aBQJOsOIcTNy9LKf2VVkIefLD2/DHPPJ7NC8l/gAhk3A20H7jnUhxqQmRZMC+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbZe6K3z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbZe6K3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AB2C4CEE4;
	Mon, 19 May 2025 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747674898;
	bh=dLlmEvd8+t0mf6JJ2OeBFyOC3U4PuZS/Ev9pQVQE2F0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbZe6K3ziClc4QgZTPR4SQGbNeotuvqI4bsRTgDSYgaRszHVMCB1Dtsw/CAFpLNxU
	 AJUp7swAfobbYu5y5IIEpxpKdaPaKVWZ46vOWcbUJCj6n6qHVUb4h/syS7zUagJ1Ng
	 eLm4PD18Q7peHEtnJDhKt3pfhQKwEe34EKjunrUpaFU7x400w3GFG+z5I0GN56XsRW
	 GTeaWlS5Jr6TODT70SQp3dFyB9RN36mSfyPvYYoWh1NqfW3MLfr1Zm/bG5BbpI5OLv
	 1HMyOhKKflI4QGjCTQzoM04+oPOId+MJV8mLL7UN41xY++qhX0l2HLtqAr230QpWHn
	 puzukVx3w4mlg==
Message-ID: <aafa7e0c-7c3b-46aa-9170-a6fefb72c467@kernel.org>
Date: Mon, 19 May 2025 19:14:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 Dirk Behme <dirk.behme@de.bosch.com>,
 Kartik Prajapati <kartikprajapati987@gmail.com>,
 Aliet Exposito Garcia <aliet.exposito@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519124304.79237-1-lossin@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250519124304.79237-1-lossin@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 2:43 PM, Benno Lossin wrote:
> This enum is not used. Additionally, using it would result in poor
> ergonomics, because in order to do any operation on a value it has to be
> matched first. Our version of `Either` also doesn't provide any helper
> methods making it even more difficult to use.
> 
> The alternative of creating a custom enum for the concrete use-case also
> is much better for ergonomics. As one can provide functions on the type
> directly and users don't need to match the value manually.
> 
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
