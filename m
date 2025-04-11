Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF815D5B6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362691; cv=none; b=rSJJ5zWNS35av9/bqdAbhzyhWDLlZGNiPWusRPvZ4a/AIXQnK90WkDWDcKGkVwB62+UY/s9QsUgnH7e7dNnHv9CDPQzjFAc2dPx4/B/yKsgw8QvX7T1eQXnDHx0XBxiV+A6HNhzvoQ82Wp293Hvhk3+w49AbX2urvT7vaxwn00g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362691; c=relaxed/simple;
	bh=B+vzSaHGLtAjPahdX89H2lYEmSIXLEFSICZZYh9/IuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTe6U0ux4QMO67Gd+/+uypqGYRZZn5CKLVnc23Hh1A09ktH1a9ZP1JGMs0eC9l313kAfT1ZqDyFGCyXye37Vm9SbMzmodDZAvNfyxW5hWH6Q+meTxdfcsr3YfU9jdxgtQvObRDLckU4VnAVQGK4VOuWsPGJx6oXVW7PQoCT81U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHG30mZ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHG30mZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F6DC4CEE2;
	Fri, 11 Apr 2025 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362691;
	bh=B+vzSaHGLtAjPahdX89H2lYEmSIXLEFSICZZYh9/IuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHG30mZ7fDp9gUYJ0YlBS7xRDLFrW2EEGfLbEmLTAVG2leok2q1va93NTMkHZHBWq
	 DgJgF0IGjyFISyAAudJ1YYdBL23Pe0W4PSeYLQHHSmtW6Met39BCTE0MMpzk53VkMb
	 VR7FBtD/8UGj9SphGUjvRk1uMu7JYGpQR0OR1yqG+gr071Xl1J4SmPDjSE1N+k+SLy
	 Fe9WpFLUMpCXfEtI+RGFsb2bTePFSwkIt//DcNg8UiHXAZgrDe9ijPq8ynaTjO3EUN
	 YNGJWdeZGH6HgIYbSgmulza1rwu4c2l3FLErRrsQmu/abqtLlemsdt+VPgtTtuoqSW
	 ICEhlJ1SsyjaA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u3AQB-000000005j0-067S;
	Fri, 11 Apr 2025 11:11:35 +0200
Date: Fri, 11 Apr 2025 11:11:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Adam Xue <zxue@semtech.com>
Cc: dnlplm@gmail.com, fabio.porcedda@gmail.com, chester.a.unal@arinc9.com,
	larsm17@gmail.com, vanillanwang@163.com, mank.wang@netprisma.com,
	michal.hrusecky@turris.com, linux-kernel@vger.kernel.org,
	imocanu@semtech.com
Subject: Re: [PATCH] USB: serial: option: Add Sierra Wireless EM9291
Message-ID: <Z_jcx6vsQ0CsxrPr@hovoldconsulting.com>
References: <20250410222849.476570-1-zxue@semtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410222849.476570-1-zxue@semtech.com>

On Thu, Apr 10, 2025 at 03:28:49PM -0700, Adam Xue wrote:
> Add Sierra Wireless EM9291.

Can you please include the output of usb-devices for this device here in
the commit message and if possible say something about what each
interface is used for.

> Signed-off-by: Adam Xue <zxue@semtech.com>

Johan
