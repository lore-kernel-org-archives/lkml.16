Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEA1F12ED;
	Tue, 11 Feb 2025 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266100; cv=none; b=U0RbBvgbPjZAER5nu9HN2AO7eO6yZKV1sPNBDmdo2R657MV97ZjQAJBGbW8hIDRoGrveMzEfbkKVV06hB2e+6ApHIjrUqilqSiu8e/Eam9KZWgeNm1F6QilZ6JKOyfDsW+II1xFsujzDtL9bDxxC+g68XUMUFppm9V9UMM8IWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266100; c=relaxed/simple;
	bh=R6uiljAcRoKayZ1aXxQix5zkrZpKgGr0ajURmERhJYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=na0Ueonl4vyyck7PjRIegyjuEPzP0xopDJkE4g6dL+uF9o5jOncc0Th/XOkoXMA1BNdJ2mtplg7R6nT2mDZu+6odmLM8IoBef9BhzKBDbL/PM7Mro1wYO2AFgkN5NXcoZp1zgWEZBK6J/wkKZHTKCqmtCszEejndLVivJJjBpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J98y4Me9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J98y4Me9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43246C4CEDD;
	Tue, 11 Feb 2025 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266100;
	bh=R6uiljAcRoKayZ1aXxQix5zkrZpKgGr0ajURmERhJYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J98y4Me9AYoJeR8lEHcIj42wX0EWH6kXOomOSOEo59gn14ipMgDuIWzSZyAPfYfrD
	 GsYd6Bwn29RocfswaGpqDBlwfRfwK7Cu7+DVMVGinfw0E/35Nikq+0B5pt1XHTYMRY
	 E4kjvCgLx4ZjlO6Ytg8zudhEvrtuPCb0fTUbjo803qpvZRBt2+FsbsVXtm1wNfbuw1
	 41IHa82IkXJFvVosLca/FXbmozudnCu5AhV7DR+vH6Ks4peQF6LePKSxd5NYUbok/g
	 /FTCe3Aq2xgHQedQ3/WjrMn2MpWQWVcoZpxIHK24tD6TnJMspM1N20Eb1gyBC3CmlB
	 3DuPpvykc/bWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmZ9-000000007EE-1meL;
	Tue, 11 Feb 2025 10:28:27 +0100
Date: Tue, 11 Feb 2025 10:28:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/6] drivers: usb: serial: mos7840: fix coding style
 warnings
Message-ID: <Z6sYO-0gZ87Dpsz5@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-4-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-4-tony467913@gmail.com>

On Fri, Oct 25, 2024 at 02:17:12PM +0800, Tony Chung wrote:
> fix coding style warning of
> "Missing a blank line after declarations"

Just say:

	Add blank lines after declarations to improve readability.

Johan
