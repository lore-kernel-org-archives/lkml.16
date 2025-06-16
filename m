Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8131474CC;
	Mon, 16 Jun 2025 14:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083309; cv=none; b=UQFsP1eWHlpv+GtHcKeMzXXJnyykLMT3QvSSoP/wrNzlZmte4OaCigmtXDHPeUKDOiUEAmVF9s72A12Emav6Xy75fRkPj4l97U/cyjcjj9z6ohqeZlyAIDnRtxaru2zouKSD8bhnMlcPBL/zEf1JVBir6A1VIIl2nXU/6bvGzsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083309; c=relaxed/simple;
	bh=pb1/Z+qqLZWMdwVqPLBQCuY4k1jN6nOv8S1+j7rAwR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfWxb+IqnGvqWHuDTvd8ua0V8Uv473MYdTl1QwEbbRX3C+JFm69A52MgMmyC6VyuZ631i+sEmCRjll+3MsfmvlINWz+JaK/wSut4Mt6GJtLB29bicPCYQ4RiGuX75yvpUp3ZOhYc8f5GuG0qffIxEVsBMJVwPHD0Z5ynuXLkOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wmVyzyo2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wmVyzyo2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B88C4CEF1;
	Mon, 16 Jun 2025 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750083308;
	bh=pb1/Z+qqLZWMdwVqPLBQCuY4k1jN6nOv8S1+j7rAwR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmVyzyo2+F/T8YD7Qs0HgbdTUEf+dA9SPF4uMsXx7kdgZZSIQ6M7YZjl6kZijs25J
	 8pGD2w+UjZLXsPlnLfX8FdmvQnS6mbXezvQ4yTt058I+PwjGs7rpEhkgUFY4Ob/Cld
	 wcpNO4/CSIzrZJCh2j3u2yH1/akr3hLtKpeFkIiU=
Date: Mon, 16 Jun 2025 16:15:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status
 Update NAK request exit dp altmode"
Message-ID: <2025061623-ammonium-outskirts-e89e@gregkh>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-7-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616133147.1835939-7-akuchynski@chromium.org>

On Mon, Jun 16, 2025 at 01:31:43PM +0000, Andrei Kuchynski wrote:
> This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.
> 
> The commit introduced a deadlock with the cros_ec_typec driver.
> The deadlock occurs due to a recursive lock acquisition of
> `cros_typec_altmode_work::mutex`.
> The call chain is as follows: 
> 1. cros_typec_altmode_work() acquires the mutex
> 2. typec_altmode_vdm() -> dp_altmode_vdm() ->
> 3. typec_altmode_exit() -> cros_typec_altmode_exit()
> 4. cros_typec_altmode_exit() attempts to acquire the mutex again
> 
> This revert is considered safe as no other known driver sends back
> DP_CMD_STATUS_UPDATE command with the NAK flag.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 4 ----
>  1 file changed, 4 deletions(-)

Why isn't this being sent as a separate patch for 6.16-final?  And why
not put a fixes: line?

thanks,

greg k-h
