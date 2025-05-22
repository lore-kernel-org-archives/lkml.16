Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB1119DF66;
	Thu, 22 May 2025 04:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889145; cv=none; b=JfhZFRk96ulE7TE/ptOuwyKej7oahcI9+C7zAYH8atspePoIBum0SfQk82tFrcdAlzJkGk1+Vj0xFyI5gy34GnDKZe0zM3/32twWJNj86pF0ouIHNSWMo+QsLtURGw0lTsU7bNHbFOSKPAWNTjpOBsrPt5FsQJtKyrsMoGph6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889145; c=relaxed/simple;
	bh=6C0K54nBGScaLhokIJVeT2gIpllspXic6lCMTjJb3Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7TBrGv5G31RoX/mfLTD1JHEtzy3HGFaMZ7pwr/XMQr3dDOsXP6/y140eJEheZ4p7hlWaIQSIah4sFI3R74Aajp1bsxklgCFZSzWlkRJs7i3Dzp6C1wAeGKy+NP2EwB7Qo55IS0jTNB3VVtSNJL+iL+5dLDyPvMMyRxx3ULwUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w3NsN89q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w3NsN89q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F76C4CEE4;
	Thu, 22 May 2025 04:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747889145;
	bh=6C0K54nBGScaLhokIJVeT2gIpllspXic6lCMTjJb3Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w3NsN89qckDGV4BLG7tH51Emy675PGtuFSCPvKTnvnrTD1AiRak2ZQzZWQwrc9C61
	 LBdTAkPuqJe80TSkbgSV+FBo6kwmvhbaeDCpxX3EShxG2EFka7aFB5vqO9J6+gtMOQ
	 DJOcB+3g1yc2K99ROnFYuz0Iqy41HdRRKDDJTEdg=
Date: Thu, 22 May 2025 06:45:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case
 style in core files
Message-ID: <2025052234-daybed-fifty-27cb@gregkh>
References: <20250522021722.28178-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522021722.28178-1-donnyturizo13@gmail.com>

On Thu, May 22, 2025 at 02:17:22AM +0000, Donny Turizo wrote:
> From: Donny-Dev <donnyturizo13@gmail.com>
> 
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

Does this really look correct?

