Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7949245979
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980735; cv=none; b=V6f60VMtM3NutvgTLllm3RryJXYMob2TnhyRhzjIR89ArFsI3drAPxlrB1vFxggOxw7ANHWtz+i61gOXYMJQB2P6bvq6TdoXj18x5WfE4mJp3j+W5EtyGmd71VzXOvxTa9ydCKn4LGbTd1C6doyP18VIVAr2i4Dqn83y3ANRjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980735; c=relaxed/simple;
	bh=YnV64/QtT6U0smQk33tylYl9ShNbYNzDtqgLquTNWyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHkEeXRI4CxhjgL2Hp+IG/Zr6o+xoofGzk0oxZyySVtai3dDsSGFMoU8BQ28HsYxQ7IFmpZlWAg+Ei05qBLvy7XzR7ESKsRTuUeyda559mcbG5Ve9Sfghndw8u7BS1QjrxfDOg948ltuLotKgCVYSuB6vr/iX5W/EcWA3sVd7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfukqMPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfukqMPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7BBC4CED1;
	Sat,  8 Feb 2025 02:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738980735;
	bh=YnV64/QtT6U0smQk33tylYl9ShNbYNzDtqgLquTNWyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfukqMPxgfD7U6Y5Fg86WRPYSmMLGC9XtkO8yc/xH+5G4Hbee1RqRobI8VIsYjl+7
	 X6KjAYr7aA7mx1Zth4ZXYU/FDrAIeH1pyt0lcxfk9qqz/drdkHVS50tWeUv8/vjIjY
	 //rWwdmNZR2sF8UMKnyT4SdK2tBUfepeznOIxtOm3H/7ftzDWMiHj2kcUgIRCrWDAq
	 vq6o/eNFrTmogSTf9qlmnbg2qH53PawQMbmZi/qVQzcxKMSZJa0AOFlMnxvMELk+nJ
	 IYb9V1+4gP+rq1DnnIXnq04BD3TxOuI5g2qOCUSFeOWyQBCYUzVmeYIzE2FI7C9sn7
	 cnThItvu/SyYA==
Date: Fri, 7 Feb 2025 18:12:13 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Engraf <david.engraf@sysgo.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] objtool: Hide unnecessary compiler error message
Message-ID: <20250208021213.2wip6pfgqn6jd2kw@jpoimboe>
References: <20250203073610.206000-1-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203073610.206000-1-david.engraf@sysgo.com>

On Mon, Feb 03, 2025 at 08:36:10AM +0100, David Engraf wrote:
> The check for using old libelf prints an error message when libelf.h is
> not available but does not abort. This may confuse so hide the compiler
> error message.
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>
> ---
>  tools/objtool/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Queued, thanks!

-- 
Josh
