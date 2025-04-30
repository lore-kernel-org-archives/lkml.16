Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0C24728A;
	Wed, 30 Apr 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014763; cv=none; b=oPBCiLUwkciFkrqbXN99vJownIppvDrNwdHq3sMjA7i3/DhwNiNrS8+TmavqOM4A2+vTCnn3SINCqwgEG3WWaiIerjaqQwBgaO9VB2tavYQ6awQfFbZGBjiKLthKFBr4AwdcKyQR7C1QZXcOYh+FL7ygYd6NO309UmEdZFnmwz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014763; c=relaxed/simple;
	bh=p4Ia0uJ5MnirWACV6j+omnrqlwzuiqI5ZBQ7CoiRF8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tsr6iESMBpgk1GlJRlzadIn2ZDB5O2DNy+0gDHmXC1Jl+cCAOP4omDSxxlcYT+5ZWHuFErrli3zyVpc/yi+rkywYlmM79zkGcCBQPeAArMl6BGKAusZVi8qskjd8Y6pSJgCSMIE+HAGvyOVfAJZ3H8je3zXSqXsQssd8mTWy0HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=L4E8QFwQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L4E8QFwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1192FC4CEE9;
	Wed, 30 Apr 2025 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014762;
	bh=p4Ia0uJ5MnirWACV6j+omnrqlwzuiqI5ZBQ7CoiRF8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4E8QFwQQyXyFUYkcYwUCF+B6O5PHcOulkBnNTDF7TD+3/8qlPS/U48eCiguDdGL6
	 m7Mzz+2s/KTx7II902jrvgT8Fpb4m2Tyx+VK61XS1ovaMrFgvrNQMtVSMlfuRyJ5Y4
	 M3QEypRR8ZKJHfikD7CVUfOyUTLsMwDtA0bYDT1M=
Date: Wed, 30 Apr 2025 09:31:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Christoph Hellwig <hch@infradead.org>, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shuah@kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <2025043004-unnerve-slightly-abe8@gregkh>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com>
 <aAdEM0crDfSP9JYf@infradead.org>
 <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
 <2025042512-corsage-handpick-bf2a@gregkh>
 <575ce02c-9128-4098-a852-d9e14f14010e@163.com>
 <2025042812-sinister-shaping-bded@gregkh>
 <097ad0fd-db38-4174-8e34-4ceb485e7e23@linuxfoundation.org>
 <b8bc6ce7-55eb-4270-b4dc-d6c853fa65ac@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8bc6ce7-55eb-4270-b4dc-d6c853fa65ac@163.com>

On Wed, Apr 30, 2025 at 01:24:31PM +0800, Zongmin Zhou wrote:
> > With one difference that the fix depends on faux_device feature - hence
> > we can't apply it to stables. I do think it is the right direction to
> > go to faux_device.
> > 
> I just encountered similar users who were using a lower version of the
> kernel and were unwilling to upgrade.

That is not our problem here, sorry.

> But if reach a consensus to  go to faux_device,
> I will try to make the change(converting platform device to faux device for
> vhci-hcd).

We have said that you should try this, no need for us to ask again.

thanks,

greg k-h
