Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63752A1A4;
	Tue, 24 Jun 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767709; cv=none; b=UPtFGum2AIJIlhiC+n6o+l1nFMo432GlTPemJuKXQGFQitKMxvnu21CLrYClJGimudGTr0Bw9WcCuGsj6F8nFVSKGBK4hr2avNVKce3wlep5SBV0zKNksDOAOGM1DdDSkuNBohQkzqaE0YOMqwRG1Z0YHfMcduGhPquNOB29O34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767709; c=relaxed/simple;
	bh=wA94sXqAIpFgEMTxTi5i3m/XKl0PgGDmPS3JbFKqq7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WeKaIdZaSAtYcvj1v4Q0Y9A6vCjw0qlAOQzVHdbo6yZqX1xPKDeZWH9KkEn9diSLVdidjQad3daBA4wjvyD/LdPjto9/ejntiUR02Tecnmk4ZWnnmdX+WwbjChEHm+ifyQEDRxJw0XSk4yjDOlLGYF+nuA9ZiLnzqK4sB8KWovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOlFmrKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOlFmrKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C261BC4CEE3;
	Tue, 24 Jun 2025 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750767708;
	bh=wA94sXqAIpFgEMTxTi5i3m/XKl0PgGDmPS3JbFKqq7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOlFmrKUwu5osjbFIQzpjuy1C1Ei7zlQIcFYdLKMEEotrYyZnQdQw6ygA7Vp5qJZm
	 WZnZmQ6hOIHKTjNGYQLoCAOM8Ss53WfpMX/4K+MGbRrkDlm2Fv+QvAUcM2J389Cikx
	 MrZhzvoTExRMUSdclf2o7kJpCu8p3ZxerY7rZ4i8zSjKXshFr5l7fovQcrJTv7oM3y
	 jOXEqCJ7H+Tlqjwpd2885wMOBofcy7iqh0u6xyhFu2x9v/KrpgerEUw5s3HPTqgX6X
	 LkdXVdSJQIwT3GqkNb8oU0CgIpJuM4NS/zWbDyqRWL8IUR8xHASRu4krWCNyFyRDEk
	 0cyAYqPdMvvOA==
Date: Tue, 24 Jun 2025 14:21:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
Message-ID: <aFqYWOZoOirYlUCy@pollux>
References: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
 <aFqT1mK7SYsYd3DZ@pc636>
 <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>

On Tue, Jun 24, 2025 at 02:15:01PM +0200, Vitaly Wool wrote:
> There’s a patch pending inclusion of this one which will be the user of this change. I was reluctant
> to combine these 2 in one series because the second one is on the Rust side, but it can be found
> here: https://github.com/vwool/linux-mm/pull/new/realloc-extend.

I think the link is broken, I suppose you wanted to refer to the patch in [1].

[1] https://github.com/vwool/linux-mm/commit/5af47ac6f9010814263617b2136203a54ed4c25e
