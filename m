Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B573327584E;
	Thu, 26 Jun 2025 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936743; cv=none; b=g0a7XWE3hhhtwLGJ3fbHmGnTvm8A4q3rNqLoB6OPBcCwRQjfqqsuoZ8vKPKEeZDaJ6b82BDqeFzR2z7op078noxt/xK5kH+zMI9ERSTBiszV8oWqlvAPjzRCictBGh6Y1w1RO2D6kkbkbWvOphpL/WUKb6gioQ5yIaY/1394mIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936743; c=relaxed/simple;
	bh=t8TKtX8+1z8+FgOghcUw4tz/UUo1RHZst3BBTMNbWMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx8jR+xsdtKJqZaoWpghtNvSLqT+CEsxnMMoLQuhegbCgpio+mZFYsWftKQUUqi8YGVDia4FcIQtMrtOCr+Ihq0GSghDB57ZpebBKgAvShTosXr/bt1IJNDEBYRVTBSfxSTkodauLpCVb514CXJpGQtigGxG/Ho3PX4dkJNeOE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50BC21758;
	Thu, 26 Jun 2025 04:18:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5C8A3F63F;
	Thu, 26 Jun 2025 04:18:59 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:18:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <aF0soSDaBE7-1UnA@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
> Hi all,

Hi,

as mentioned offline, please rebase V2 on sudeep/for-next/scmi/updates
and add proper version diffs summary all-over.

Thanks,
Cristian
