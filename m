Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372520F078;
	Mon,  3 Feb 2025 18:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607341; cv=none; b=k8FYy8N2Mmay9TqFDUH2mDXlBUi+UWgJHBc08znUkv582c7ODAWbLDFCbV2FVhA36hu+Y2HxlQtu+R+5nFGm34FjnJW9aVGSJvttUo0YcwmwuVdX6nvi5lB7ojQd7JD2XAJgsbhk2NbI+JaS08GhNDpAam48XlzY41kr6kbDQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607341; c=relaxed/simple;
	bh=++UD51iTwuniLJR46IJQEfzBH5GAbL7MvDjMZ8Q/Uh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhPyWnyGrMOdgAjt7PITsGC2NZvqhzcV9txgAOgFVCW9+8tGbk9ML/vpoICJ8SUztGKz8lQYJZeNsIRUfehZV9zUF2uawGPLge6Ie705oUSyIyl4EDbmng2M/TmLx83O+8Ef0lLqtuS6WCl4kOuiZU/Gg5DLWECSFJijuSGomcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCXPy2w9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCXPy2w9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75A3C4CED2;
	Mon,  3 Feb 2025 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607341;
	bh=++UD51iTwuniLJR46IJQEfzBH5GAbL7MvDjMZ8Q/Uh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCXPy2w9w/LJ6eB2V1f/hzdsZLu3XYKPsv2marIvhqX89nkOtmYGeV/LV+ulmnfJM
	 +gVQtBwQcxD1g6UIc5CLUEPsi35KRNeRpHc4CPMK63ta3wxLuxOPeHCHQoShWfGNpn
	 1iwBrxDg8boyjB9wBqtfszd/ZRqPrx/VFkT/opZmoU1FA0DMRWHoRQroh8r2rcr9JZ
	 yD+A9+CJI2MyHW07Zo8suIvtXyRzqjVYfPB/ZWp4se8ofiKfN//KPRms0bvipdm4Ns
	 13Km+zoGBoDPo+OlrsZUvodxrlairLflxDbGjMk1LawUB+8dF6/xyw9Da1+w0LlwCj
	 FZ7lWqPhk9XuQ==
Date: Mon, 3 Feb 2025 12:28:59 -0600
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Anderson <sean.anderson@seco.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] dt-bindings: xilinx: Remove uartlite from xilinx.txt
Message-ID: <20250203182859.GA3352680-robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>

On Mon, Feb 03, 2025 at 05:28:38PM +0100, Michal Simek wrote:
> current-speed description has been added to uartlite description by commit
> 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for
> synthesis-time parameters") that's why no reason to have in xilinx.txt too.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> 
> Fixes: 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for synthesis-time parameters")

Should not have a blank line in between and Fixes goes first. Will fixup 
when applying.

Rob

