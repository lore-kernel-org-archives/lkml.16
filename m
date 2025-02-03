Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEE2063C4;
	Mon,  3 Feb 2025 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596679; cv=none; b=k1joQomVy+56ObRqJyj4BTE1FG297G+g0BJcHGE37p+ipg5YjzXMcpqWNqdvz+WvWIJY86WlCLilzs0jtFThejR/YpjyMiv8gYJ5N5p+jRqMZdbJr/9Uypu4/l0KQv5hNCr0BNO3zCbJ9+YSX4my1STtAXWJPMF8aG0ZD7dbVFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596679; c=relaxed/simple;
	bh=DheBn+c11wMWYeaHy4BEGjpqWzXZyaq3iwHuxln6l0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrczwMqL0anuaIOGLNIgpubQFjYh6r2NDmp+MrlmnX5xAlA3HQ4Z8KNHRhtnIzkWTYmA5N4ZN0lUWsQAAlS0AUHjVAPCmEySUH2v06wgieWaze2QSbzvxUWj48x9nGwF5amJjJtDEfTuafUwPosHCP49vQ1pVaO1Z2Ridr+ouhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EZfPpPIH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZfPpPIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07BDC4CED2;
	Mon,  3 Feb 2025 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738596678;
	bh=DheBn+c11wMWYeaHy4BEGjpqWzXZyaq3iwHuxln6l0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZfPpPIHwXEm3sWYqaU4CqwKqSRTghWNfigvpGyDenwJ4U6FXsoTSOu7x0fi2Msmx
	 vCGUjlwm2/nWvDZBrIV5TsC4Xj1OQ95V4UNhFX32xPIRVUBN+kdAI4L+WrjxnUr275
	 nUTCKHaRCQc+iD9AuK35AJLOxQi/+qYh/dXNU+Tc=
Date: Mon, 3 Feb 2025 16:31:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benson Leung <bleung@chromium.org>
Cc: heikki.krogerus@linux.intel.com, abhishekpandit@chromium.org,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, akuchynski@google.com,
	ukaszb@chromium.org
Subject: Re: [PATCH 2/2] usb: typec: thunderbolt: Remove IS_ERR check for plug
Message-ID: <2025020357-chaos-battered-172b@gregkh>
References: <Z5PstnlA52Z1F2SU@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5PstnlA52Z1F2SU@google.com>

On Fri, Jan 24, 2025 at 07:40:38PM +0000, Benson Leung wrote:
> Fixes these Smatch static checker warnings:
> drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug' is not an error pointer
> 
> Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>

Please do not put a blank line between "Fixes:" and your signed-off-by
line.

thanks,

greg k-h
