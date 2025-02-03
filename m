Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99031863E;
	Mon,  3 Feb 2025 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572151; cv=none; b=h7zbrC2oEBuYP1hIIG3wABX6XXhS7Buyxig01tM9yedesGYNNM5BLVxj7kUrAbZdKA+8E0U33emddoQrgTfEo6hasgqZfTNwfaaMJFEQAuMN14/86TDWZmPS8FD1qoJdqyCMPJA9L3ao/I2MfYy/FyJSoAz5rayrvSljUOzvo+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572151; c=relaxed/simple;
	bh=9aJ9BHrjqaB9M3L/phe1w/cBaLzDm/a1APfOO4N4alM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nORQgxpshRXiQb08Wr2l+zhc3tXQB021a1IWpN+gOAKiW++3CV5TGOOT4HXOgZcxDTObR5uH/nLbYVNSwW+FBzEA4n7oLSY4oltjtksyHEmwwOly/T/V6wcO2Eq3GpcvwXHdBO1c0BEYw4BJXuvaqoEDp6zJT5eatXB/KCzDQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBo2AI0d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBo2AI0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738572149; x=1770108149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9aJ9BHrjqaB9M3L/phe1w/cBaLzDm/a1APfOO4N4alM=;
  b=KBo2AI0dAsF74ktJf0Ft9GR6Bo20dkGcvooiQ1KfjcdHzl6yjz2dG9nb
   fOSkf2tnZEY/lGRY0hTt5ROV8Ct/WswqdQ9BfQiTIFMCpmK3oNrBc3LOI
   EJm3xkUniOdjunyLzpDBFzLxm4bRAXHLGHt22wDBb5DaB3IHRRjwWv8q+
   cUL06dSbyTPRYmb1YQ5ddjq0pmfaIIbcGY52NAf4UiNBtIIkLTUs9x/hL
   XEycITQDMIhaQZ35CKQMjquqDRYv89mtakHd0r6fck2abn8eV8YbIMrMg
   vdZl6gz0tPEwrCY8hvOhePpD/CK0MQm0WGGOFumknkBCfO2e7s2i33vVR
   w==;
X-CSE-ConnectionGUID: cnSD0tz+TuyxEZjIh9r5Tw==
X-CSE-MsgGUID: aGvdMprKQ6KTGgsRLw2SLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38261529"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38261529"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:42:27 -0800
X-CSE-ConnectionGUID: r2cvfThLTbiJWagSZet7QQ==
X-CSE-MsgGUID: 4JfoicegTxucAaa9yLbL3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133480373"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 00:42:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C36E5214; Mon, 03 Feb 2025 10:42:24 +0200 (EET)
Date: Mon, 3 Feb 2025 10:42:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250203084224.GE3713119@black.fi.intel.com>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131014406.28645-4-rahimi.mhmmd@gmail.com>

Hi,

On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> Updates the Connection Manager to disable the Gen 4 Link Recovery
> flow before transitioning from a Symmetric Link to an Asymmetric
> Link, as specified in recent changes to the USB4 v2 specification.
> 
> According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> published in September 2024, the rationale for this change is:
> 
>   "Since the default value of the Target Asymmetric Link might be
>   different than Symmetric Link and Gen 4 Link Recovery flow checks
>   this field to make sure it matched the actual Negotiated Link Width,
>   we’re removing the condition for a Disconnect in the Gen 4 Link
>   Recovery flow when Target Asymmetric Link doesn’t match the actual
>   Link width and adding a Connection Manager note to Disable Gen 4 Link
>   Recovery flow before doing Asymmetric Transitions."
> 
> Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>

I did some minor modifications and applied to thunderbolt.git/next. Please
let me know if I missed something.

I tested on Intel reference hardware as well but on those link recovery is
already disabled so it pretty much does nothing. Below are the steps that I
followed:

1. Boot with "thunderbolt.asym_threshold=10000" so that the driver switches
   links to asymmetric already upon first DP connect.

2. Connect USB4 v2 hub.
3. Check link and PORT_CS_19:

# tblist -v
Domain 0 Route 0: 8087:5781 Intel Barlow Host Router
  Type: Router
  UUID: c9680000...
  Generation: USB4
  NVM version: 56.81

Domain 0 Route 1: 8087:1234 Intel Barlow HUB Router
  Type: Router
  Speed (Rx/Tx): 80/80 Gb/s
  Authorized: No
  UUID: e9688780...
  Generation: USB4
  NVM version: 56.81

# tbdump -r 0 -a 1 -vv -N 1 PORT_CS_19
0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19     
  [00:00]        0x0 Downstream Port Reset (DPR)
  [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
  [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
  [03:03]        0x1 USB4 Port is Configured (PC)
  [04:04]        0x0 USB4 Port is Inter-Domain (PID)
  [16:16]        0x0 Enable Wake on Connect
  [17:17]        0x0 Enable Wake on Disconnect
  [18:18]        0x1 Enable Wake on USB4 Wake
  [19:19]        0x0 Enable Wake on Inter-Domain
  [24:24]        0x0 StartAsymmetricFlow
  [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
  [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)

# tbdump -r 1 -a 1 -vv -N 1 PORT_CS_19
0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19     
  [00:00]        0x0 Downstream Port Reset (DPR)
  [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
  [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
  [03:03]        0x1 USB4 Port is Configured (PC)
  [04:04]        0x0 USB4 Port is Inter-Domain (PID)
  [16:16]        0x0 Enable Wake on Connect
  [17:17]        0x0 Enable Wake on Disconnect
  [18:18]        0x1 Enable Wake on USB4 Wake
  [19:19]        0x0 Enable Wake on Inter-Domain
  [24:24]        0x0 StartAsymmetricFlow
  [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
  [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)

3. Connect monitor to USB4 v2 hub.
4. Check link and PORT_CS_19.

# tblist -v
Domain 0 Route 0: 8087:5781 Intel Barlow Host Router
  Type: Router
  UUID: c9680000...
  Generation: USB4
  NVM version: 56.81

Domain 0 Route 1: 8087:1234 Intel Barlow HUB Router
  Type: Router
  Speed (Rx/Tx): 120/40 Gb/s
  Authorized: No
  UUID: e9688780...
  Generation: USB4
  NVM version: 56.81

# tbdump -r 0 -a 1 -vv -N 1 PORT_CS_19
0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19
  [00:00]        0x0 Downstream Port Reset (DPR)
  [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
  [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
  [03:03]        0x1 USB4 Port is Configured (PC)
  [04:04]        0x0 USB4 Port is Inter-Domain (PID)
  [16:16]        0x0 Enable Wake on Connect
  [17:17]        0x0 Enable Wake on Disconnect
  [18:18]        0x1 Enable Wake on USB4 Wake
  [19:19]        0x0 Enable Wake on Inter-Domain
  [24:24]        0x0 StartAsymmetricFlow
  [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
  [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)

# tbdump -r 1 -a 1 -vv -N 1 PORT_CS_19
0x00d3 0x0004000e 0b00000000 00000100 00000000 00001110 .... PORT_CS_19
  [00:00]        0x0 Downstream Port Reset (DPR)
  [01:01]        0x1 Request RS-FEC Gen 2 (RS2)
  [02:02]        0x1 Request RS-FEC Gen 3 (RS3)
  [03:03]        0x1 USB4 Port is Configured (PC)
  [04:04]        0x0 USB4 Port is Inter-Domain (PID)
  [16:16]        0x0 Enable Wake on Connect
  [17:17]        0x0 Enable Wake on Disconnect
  [18:18]        0x1 Enable Wake on USB4 Wake
  [19:19]        0x0 Enable Wake on Inter-Domain
  [24:24]        0x0 StartAsymmetricFlow
  [30:30]        0x0 Initiate Gen 4 Link Recovery (ILR)
  [31:31]        0x0 Enable Gen 4 Link Recovery (ELR)
