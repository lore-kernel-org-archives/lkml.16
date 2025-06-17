Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F89229B28;
	Tue, 17 Jun 2025 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150488; cv=none; b=fvN2gZhBrOZDA1a9NmoPza3cNFxqmESu2lREpDg2w3l5wJQB+57ILRG+bd5JiKKRy2aSGTj8uXc8MCz/ja9P0cw4YdBJCD3b5jPxSiHbfP2HsW2fVyC2ZH5Snqb942JgqB9/bTtmdCnCHy9wYSP2cAiF1UCMBhMddwecxkSF7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150488; c=relaxed/simple;
	bh=gi83ut+L/fFlrJRjwZ/UO/0sSnXEyFlsXE9bEeWJdEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUp4kQ6FJWBb78z1MqltrGohJIQ4S2piKSPLp5YV0t2spZaWeNwdEdcSWMXZ6gJRXCrX+/wGSY+RauVgCu3IhDPTo4X5OuSy5Vc/hMCosuedWIxmKIkz9nJI9yq3WpagT0uIV6gKt2i9Dzq9UiSpJLJAyrXEc1nhMwXoMt2jp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9zRLv3F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9zRLv3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750150486; x=1781686486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gi83ut+L/fFlrJRjwZ/UO/0sSnXEyFlsXE9bEeWJdEg=;
  b=n9zRLv3FFB2CUu3kj8Sz/yh0hBKYA0JW5vJ+Zahvm3F2MZLRk1fT1mZE
   KoVZ9dcWQtOAarIXU8GS/0TW17ZagjlIjoE5FE+BshBf0pJayS8FnDTJb
   LBW9uA4KS9i2/aXIlW6ThU46ARu0Lb2U7JGBFWUjkQ/yyjZZ9LHDBHA27
   qYq49Q1cGHoIVN15DDDSRQ23ZwJq5nDOaxOy+KeDJ4nLy+iL9C55aWvPr
   u21MOr4GFkLr/B9L5frkFL8cLr38g+QBuHFUCmSj46PL+xXZVlm5GFw1S
   AwB0lN9gqvK38uJRagwz/uBcZTeF6BBKpYKfQn7LS2BqrvxpvOgJuxJx2
   A==;
X-CSE-ConnectionGUID: QL78lqSwRHG8tODQts7DuQ==
X-CSE-MsgGUID: xj/zayvORVWW3dJLLghlwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62968011"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62968011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 01:54:45 -0700
X-CSE-ConnectionGUID: 9LOb3JqSSAif8ITz9rPKEQ==
X-CSE-MsgGUID: ZxcRlcFARNGiRTsvANYcqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="149081447"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa008.fm.intel.com with SMTP; 17 Jun 2025 01:54:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Jun 2025 11:54:39 +0300
Date: Tue, 17 Jun 2025 11:54:39 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status
 Update NAK request exit dp altmode"
Message-ID: <aFEtT5JAaGQIs-vG@kuha.fi.intel.com>
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

Hi Andrei,

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
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index b09b58d7311d..ac84a6d64c2f 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -393,10 +393,6 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  		break;
>  	case CMDT_RSP_NAK:
>  		switch (cmd) {
> -		case DP_CMD_STATUS_UPDATE:
> -			if (typec_altmode_exit(alt))
> -				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
> -			break;

Commit b4b38ffb38c9 ("usb: typec: displayport: Receive DP Status
Update NAK request exit dp altmode") addressed a very real problem
with failure to execute data role swap. You are not really offering
anything else for that issue here.

Is it not an option to just schedule the mode exit here instead to
solve the problem?

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..2abbe4de3216 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -394,8 +394,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
        case CMDT_RSP_NAK:
                switch (cmd) {
                case DP_CMD_STATUS_UPDATE:
-                       if (typec_altmode_exit(alt))
-                               dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
+                       dp->state = DP_STATE_EXIT;
                        break;
                case DP_CMD_CONFIGURE:
                        dp->data.conf = 0;


-- 
heikki
