Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72D17A305;
	Fri, 30 May 2025 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748630712; cv=none; b=AJNaOmdlU/Y8/o8tvH77v+Vr3lHDaHEP8Hab81gq/Q9+tshHEDIJkSjPmbZLEYrpVqv9iNRT6RhlwG/ce2NrkD9td/b+Ed0OvBJ0MjPBMzBFrpcE/JhJS+eH7fWPDqlJWf7MEEvYXT3+VbR7uu+u8PR1HNOsCf+rcKK7Sj+oLIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748630712; c=relaxed/simple;
	bh=WhTr/vuNP7VQtz2uE8C6WdslFGZO/dmOeZfl4MeTbu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nt4p0GnA+hFOvh5oe3/WWCLPBQ5YxXs7cPI4iILH8ub1KWjn/RBZDPicv0mV/21NORYTnWDH5cIT/kM4Wd0fGLS0I6IimPd/S5VvhHyIKmSfuhpRR1I+cjXN8/m80aNemJooeY9eYvzyxQzxAeu51q6re9KsI9EUi3GD5D4fCys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/ViDTBc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/ViDTBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBD0C4CEE9;
	Fri, 30 May 2025 18:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748630710;
	bh=WhTr/vuNP7VQtz2uE8C6WdslFGZO/dmOeZfl4MeTbu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/ViDTBc8/PRrdguA4+dkYzS8OmAzcxl0kJSoO1PLLF/n4OAzjY8VB7ZzLmmqPQv8
	 GYwl7S7MAgO8fK2BgqHQ0iFiU/MG0L68gna93GokvTHcNETa03IgOwVkHxIRJF1+ur
	 emsJ+4c2gcLO9kijDRf2IhjeJCgHCPUDMu5MzF6T68TOSclwCkPP7gKP4xxiz0cRcA
	 kD/DXb0fRJ2A4dYLQFI6udmwdlEzywKCIhHcxi3SYmSTCo0PWRVmzUbNhfBOzrsLMA
	 MDtRtLFDwidiqM+3z1MbJucDOadA9X6GcC6Wth+Eae3Jupdo0yyxtP61H9KGvB/uG4
	 8/o505otO2CXA==
Date: Fri, 30 May 2025 20:45:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] misc device: support device drivers
Message-ID: <aDn8sSzjNk7gCGn5@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>

Hi Christian,

On Fri, May 30, 2025 at 06:37:29PM +0200, Christian Schrefl wrote:
> If you want I can send out a new version using `Opaque`.

Sounds good, you can also give me a version that you want me to add to this
series, given that in order to use Opaque you also need the Opaque patch of this
series. Without you can't pass an impl PinInit<T, Error> to Opaque.
