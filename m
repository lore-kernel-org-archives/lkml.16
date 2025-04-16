Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597621EE032;
	Wed, 16 Apr 2025 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811479; cv=none; b=UjgdO3uofN2zJCKht6V9SM0DZZ01ZYbCUDZ+sEm7m9NMF2e8A+uO0jSElfiuNW0zTz99jBVLcD9yqBpGqOnvfI3Yr7zvnt6wdoJQ4octyTPoCrNI77OowM8BOZTyu/ieg/gwOwsFTGlI435FF0MNXnFmXcaYQWbVQHNStOdPuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811479; c=relaxed/simple;
	bh=+wx2sC6I5mlk2PyZ3qWyksEMyQYV4JAGVPjVJfE7+BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZS5M/nlDQe4ykhXwBupz0q2kUVQlGj3Ko64bIe+IVRioKg5CpOkb+cwxOEmV7Fq2iosslXys4y/Mo4IcYlA+mStR1E/6ndnHqEY8peUtUifjx+vm/n+/+lrxbx4U6Ka31jUtc6CvJdrQgcSVlehCYVJIIW5Hje+BRkhEzW4y6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEl9mE9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEl9mE9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3115C4CEE2;
	Wed, 16 Apr 2025 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744811478;
	bh=+wx2sC6I5mlk2PyZ3qWyksEMyQYV4JAGVPjVJfE7+BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEl9mE9Qz65zZEEe8CDmj9B6yMm90nyYxYB1fVvAbVMgHg0kDt3s6ZyDiANWHezbt
	 QuNgb+QTfKC5QV2PWG7PDwuJVrBwxACR3GLyHs+c8R0H/gm+x0sRSqRmpzsdW15Zl+
	 AsiYHsCZfVqMhrdlUYXlcF5H2GMvFlmQ2UvBl5oSKUCFhKs25BvSmTnQ7WlP3Myysd
	 NU33Wj0GcjPVOLn7WI0VzeQFwnAs5wx7LL3HA3LASrBZ93J/MAWJGmKCtJ58Ux2Sbx
	 3nykTBsgwSsXb2GJIpPbFlrim4T13lyKzAWQF6XQHfp86awEzmO8QEgkAujQqpSd7+
	 zhnsyDOllKTFw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u53Ab-000000002BI-28Ur;
	Wed, 16 Apr 2025 15:51:17 +0200
Date: Wed, 16 Apr 2025 15:51:17 +0200
From: Johan Hovold <johan@kernel.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: ayushdevel1325@gmail.com, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the
 checks as first-patch
Message-ID: <Z_-11fvQJtiwAxaA@hovoldconsulting.com>
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>

On Wed, Apr 16, 2025 at 05:47:41PM +0530, rujra wrote:
> added comments on spinlocks for producer-consumer model, rearranged the
> lines on function calls where it should not end with "(" this bracket,
> also removed white-spaces and aligned the arguments of function calls.
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

You're doing too many things in one patch, the patch is white space
damaged, and the patch prefix is wrong since this driver does not live
in staging.

If you want to practise creating patches, please make sure to work in
drivers/staging where changes like these may be accepted. 

Johan
