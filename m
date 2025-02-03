Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42420E6E7;
	Mon,  3 Feb 2025 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607403; cv=none; b=ldieDUz376oucxCYdS2pxBkSDjmKOl/Bb62o3el90zonwinlxA8lzyBYNrWPYQFCd/l97sGz3+tqtT1RIlVXslk9FrsMtLjgzohxpWE+rOoHi/WAZJn/T7K4M/hZg1ILDdrShSALAXMkvnYqOmuC+ezPwSCqZ45S5fMfHfxCToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607403; c=relaxed/simple;
	bh=hfIn6Nqm/wp7zDRzCx0UTbwibJWk73BuSUAvwxU6kT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP45ebmvLBWgtW0ursJWfigekfcfTq5TpyOylvyTA9VFuGGmiUhC5khrlg5e3ywy4WEPATG2gaj6kP/y747ewSAwkkLVOxQCZlwvAbqeqnABjFgrFBcI6s0MdXKgGqPMbHU9O+Sj4v81b0br7CXZFKDxApvk4+c98H4k8QsBIRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X46kaLir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X46kaLir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F289C4CED2;
	Mon,  3 Feb 2025 18:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607403;
	bh=hfIn6Nqm/wp7zDRzCx0UTbwibJWk73BuSUAvwxU6kT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X46kaLirVYi1oOPQRemFPlg1QxntTBeMtPk5CwqLluRieEt2emoxsOaZDnM8UUWrn
	 gJr7okpzE3lfjRd5Q2HdylVD2Gvfo4aRE7duRZs0xiXiAFq/M60FIG6t6FHW24QOXV
	 3uiI71+WhFgzNeEPW9/CeHAZQhdwZmNnKbv5byGG4lxEPA04Z1NRVqHCvGylfe5Z8M
	 o6rNQSnbucc9DyeGEbfLilrkYlyA5FyJ5YS2BPjPdRT3r2gdBVQWoRPw+NDtV9nhby
	 Znngv084wkcfcsaHC3lqt8JUmDpx39L/B1lWUwDB4TOIB9k/tJemEP/rO5nkip2oL+
	 LI8JvvtvO3vqA==
Date: Mon, 3 Feb 2025 12:30:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: git@xilinx.com, monstr@monstr.eu,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michal.simek@xilinx.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: xilinx: Remove desciption for 16550 uart
Message-ID: <173860739995.3355439.1989355900626957984.robh@kernel.org>
References: <cover.1738600116.git.michal.simek@amd.com>
 <d90a839566a56df6a0c3b203f701bd863108d047.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d90a839566a56df6a0c3b203f701bd863108d047.1738600116.git.michal.simek@amd.com>


On Mon, 03 Feb 2025 17:28:40 +0100, Michal Simek wrote:
> Documentation/devicetree/bindings/serial/8250.yaml already contains
> description for mentined 3 properties that's why remove them from
> xilinx.txt file.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/xilinx.txt | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Applied, thanks!

