Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73E3D984
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792512; cv=none; b=Ao3lQBeJUEePcz1qp1kOvBG44JtaSDFei5N2VtzDx2umpV41eLfOz18u7pRxjHw5+5bd9w6j8Er0Ty70wjwbztMWNOvqapsfzhVlRA/CnZa/xDiVDRVhJo/9tVYGHeS9ntK5c9hV7eLMBiec8SzPLpa35ILo6IkP5N+V3iEJ6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792512; c=relaxed/simple;
	bh=Gs0nJRuTBTDaKuJl3yu+K6Q1B0F87h10QGs5wgneAf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEEkbVo1Ezp7fLJNcaFVoyeHz9Hw58W/5DrxJbwAAFAzAbl91BEdgvxF6hwFjyJ7Jsii6fOQert4Pkd2L+YrHTFl8NVftMjPJ3QfcjuaqxL/sH6wkBWO8fIUk3cjDQWZzEGvIHJq+bYFo0I+WLMOBYFW9fhYNmTQCzRIflnagQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3gAWF+C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3gAWF+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB9CC4CEE4;
	Fri,  4 Apr 2025 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792512;
	bh=Gs0nJRuTBTDaKuJl3yu+K6Q1B0F87h10QGs5wgneAf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3gAWF+CHCT7VzLgOVVjyLHXi2+j/f1xNoFAT2TmGu7CibWy6lNU8xbHicdi3fn/P
	 jI83IVRif+/xIRh4i0WKac/KqqOMwZCv/9Cos3HLTTVguDtjkOZm/brV6FWFxnK7+a
	 bvAON39j9BOyXx6+HL5lszwAgXVRhKpTMb1GpMzTIPLDPYBnRnJJLTDJvQ7Kr6QxmV
	 OQ5c/PS4R4COk4Ndj0bKyOAdrg83L0ORSMhmLvjhWzeSPk+Q5uH122UNYnegAK89cL
	 4y5sqJDO9tDT2rLAPQMxhUb0XjmvdT8wN4cr9VKlE8pBMi3U6LRbD79RjDLTG3xrGr
	 B2LneAzVSk5Gw==
Date: Fri, 4 Apr 2025 08:48:30 -1000
From: Tejun Heo <tj@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] workqueue: Better document teardown for delayed_work
Message-ID: <Z_Apfln-x0RF2d2M@slm.duckdns.org>
References: <20250404101543.74262-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404101543.74262-2-phasta@kernel.org>

On Fri, Apr 04, 2025 at 12:15:44PM +0200, Philipp Stanner wrote:
> destroy_workqueue() does not ensure that non-pending work submitted with
> queue_delayed_work() gets cancelled. The caller has to ensure that
> manually.
> 
> Add this information about delayed_work in destroy_workqueue()'s
> docstring.
> 
> Add a TODO for destroy_workqueue() to wait for all delayed_work.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to wq/for-6.15-fixes.

Thanks.

-- 
tejun
