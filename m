Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8E21128F;
	Tue, 11 Feb 2025 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278527; cv=none; b=C6hg5bXV+BT0sWgZal8aOobj9mFtN/cOavLn7OuToeR+X1wtRqXCJjJxsmymufVBOvyV3qv6OVqhMPzaqqwi9lUJj/ew2wRqV3XBnlcls4DKLMSDTS7Yxn2Qn/38JYtMbAJ0NcOsE4JZkErpXT2XfDkYK68R3AiqnTOt6lCqidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278527; c=relaxed/simple;
	bh=2GSp+olEHX5d9q1fUBuTtLdbywDe+H6vZe9ucwKdeqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j539ZE/O5mIfU+QwFlGHXXdEDzqSoMcBKOlIjfvTamJIaG8vuNcvuucatVX3DB7Yavyx0FBofjoDL+jsz1uLsniMIYcjWGCE8pComqpOT7nTAmTIiU/uUHRvXuBOF43GZgbStjyQug9juFx5O7S7ZMWXDJPQgS2hew4Yqm00G8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txeP3OBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txeP3OBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B855CC4CEDD;
	Tue, 11 Feb 2025 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739278526;
	bh=2GSp+olEHX5d9q1fUBuTtLdbywDe+H6vZe9ucwKdeqM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=txeP3OBxl+tQb4dVRqq1bEDmqFfxTn0p3b3LWKQAuYGaToEHQMnCHBO5AQiRZFb4w
	 6YQYQKiPq0wTc8sJ2mrETPyjQLr0NZcAqXXrbWZZKK6VOOs8YEl4suFyyZCwuX//oS
	 5wtX69uq+daJnLpT+pR+i8JSaWfD9CT0Zrno3BlhrtDELVMADpzqlD2RoEHOM5LcDG
	 khNdolhepZWG5HDt7pGmhRVzf54tqW9nocjzRhqtMU2rNUCp2ooxGlNKwzF70cM7bf
	 PC3K1ZFOuspHlXwJrCxL7pTC69eAf7wrzj7eGOIUDz/dk68UhZGTmSIa/jEG7JBhkI
	 c3nFqRB/jRXPQ==
Message-ID: <d3712a1b-48da-4d94-82a9-e7f627dead3f@kernel.org>
Date: Tue, 11 Feb 2025 06:55:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: dts: socfpga: agilex5: add NAND daughter
 board
To: niravkumar.l.rabara@intel.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, nirav.rabara@altera.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/10/25 01:46, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Agilex5 SoCFPGA devkit supports a separate NAND daughter board.
> Document NAND daughter board compatible string and add board file.
> 
> Changes in v3:
>    * Document Agilex5 NAND daughter board and use that compatible
>      in the device tree.
> 
> link to v2:
>   - https://lore.kernel.org/all/20250205101318.1778757-1-niravkumar.l.rabara@intel.com/
> 
> Changes in v2:
>   * Use nand flash node name according to dt bindings to fix dt build warnings.
>   * Arrange node in sequence.
> 
> link to v1:
>   - https://lore.kernel.org/all/20250107084831.2750035-1-niravkumar.l.rabara@intel.com/
> 
> Niravkumar L Rabara (2):
>    dt-bindings: intel: document Agilex5 NAND daughter board
>    arm64: dts: socfpga: agilex5: add NAND daughter board
> 
>   .../bindings/arm/intel,socfpga.yaml           |  1 +
>   arch/arm64/boot/dts/intel/Makefile            |  1 +
>   .../dts/intel/socfpga_agilex5_socdk_nand.dts  | 89 +++++++++++++++++++
>   3 files changed, 91 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
> 

Applied!

Thanks,
Dinh
