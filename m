Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B4257AE8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653161; cv=none; b=dMZcZUbTDqJYaXz2Xae99qMhIp0f28C8gPLHzkb4Vm/RV0xtzAHII2TexP4LtgJ3JCJz8d9ZhfB2U7DnBiWriEThM1ccG+FgXtcZQsuWTYbU7GWdoIlkWGhkruRdENQhDxuQuBxiHNLDRB40twaxfnz3nGVjwYhWo+R3XY6uq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653161; c=relaxed/simple;
	bh=cjGuNYcWX7A3WWeGxELmLfILX5LvpZgsNyOBOCjyPOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trHwV8DsFJ67VecBszE7qgvJlKSv5ww73akfHnIS6+gwkYHAki1/7vwnHpdAC9HBIOHJdG/+cEr0HHapQGzbwV0WaxNyl+oxNUOop5o2lKXMeSgkxha66Fb8U9y69W9MtiqZHkX6yc36jIlV7qYsaS03f75BgUjdjMzLeFNYoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trguIh+8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trguIh+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EDDC4CEE2;
	Mon, 14 Apr 2025 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744653160;
	bh=cjGuNYcWX7A3WWeGxELmLfILX5LvpZgsNyOBOCjyPOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trguIh+8+A33Ujniy59A19uL+PM5Ql67Vp2xs2UwUsIbRirXGa8Ci99NCvL5o9SvF
	 5ktQiAf2PHPiadp6m8vATYHVR73zlIG0kTzS6Mz9cwBxTHh+GnCwtoNVMkW7b1Kmt0
	 YwdWdshWIKxMBVBVFgTBTAf5sk7h3EMn0cff6k1jOEWaEupkC8AuiZ/3DqgnEez62S
	 PoN81wCF9s8om5gCgYhK19ShTZHk929OWs91ADlyyS0bLfYS45d75CokIYTDGLM9E2
	 Nea3BcR+zEjs03oaykmK9a47PkjhTRVVbGqBVGORYjIOoKSFpZQECniQZ4mQYMmgAn
	 Qqt3ONiTCoR0A==
Date: Mon, 14 Apr 2025 19:52:36 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Tejun Heo <tj@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] MAINTAINERS: update the location of the driver-core git
 tree
Message-ID: <Z_1LZHFnwiKl2MlO@cassiopeiae>
References: <2025041447-showbiz-other-7130@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041447-showbiz-other-7130@gregkh>

On Mon, Apr 14, 2025 at 07:40:48PM +0200, Greg Kroah-Hartman wrote:
> The driver core git tree has moved, so properly document it.
> 
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Dave Ertman <david.m.ertman@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Should we use the chance to also add the corresponding T: field to the
FIRMWARE LOADER entry? Are there other entries that go through driver-core?
