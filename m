Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9962B158535;
	Tue,  3 Jun 2025 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748979891; cv=none; b=fgW98I1UPsb/YVuoN8S5MDmvDIuZIrJi92dlztMCleh6i+blECmmFSKQVe3oFJyGgcFFigzsL2wDcaxVjq4HAyTNNyzifsZzGS7urM+2aYYJpcKrVN2aEH9+josw5zKT+qDLl4LJNSWXM4psrqBaUCIxGxdtjn4kcWk45dbFgbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748979891; c=relaxed/simple;
	bh=4aZBOPYqH9S4e6PNl7Tl2VkmmqQKytqkj+5M82qXyRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIPkCsrpFwFkE7yamzyAabod3EEbHCt9/Gi5xY6fiu8Q4GSGwu+p8EBW2/dbdtbBUszbOcJXXBF/4XaKSjQG7hXg5g55emiHbR9bYbR/aJ29hzdZSEyW4wF2XvKCi+Ng/2PgEy1deMNhYyDKi1rztBwHdc6QmoIMHklZqne/7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ4OLDFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ4OLDFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953E0C4CEED;
	Tue,  3 Jun 2025 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748979891;
	bh=4aZBOPYqH9S4e6PNl7Tl2VkmmqQKytqkj+5M82qXyRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WJ4OLDFQKbIdSDfi7ndjpCHcy1D43QH8QdyOfJl+qooABhuGzktGarNptQvPWjLMF
	 QVH2VJYV4VXmcVf85lohuaYhRZQRcwhSUmU5k16w6LdlNlX5ctTaAMupVN/1O9x3H+
	 DRL144oHO1SUdX8Zp5t1cjzlQhCO/Myz3Y4BAVRUCYzQ5PBanNodNTo8cWsHmoMxVR
	 HY1OzO2UW1SUPIsopbJjdfUIImL4UMyu3zaoHFp21wYS9b6tyR6qWbwg4lTAFQlWGT
	 43TNbqPIYJ+WdZ6QjocqSMrfmUKj+UuGBxdBbakVC5cko4vwiTGE3S3hQsKbVbSpLT
	 Qz6xw1s7jjo/w==
Message-ID: <4dab7429-9b4f-4e76-9076-aa3eff759730@kernel.org>
Date: Tue, 3 Jun 2025 14:44:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] firmware: stratix10-svc: Add support for HWMON
 temperature and voltage read command.
To: mahesh.rao@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-4-6a08a4502de3@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250526-sip_svc_upstream-v3-4-6a08a4502de3@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/26/25 01:25, Mahesh Rao via B4 Relay wrote:
> From: Mahesh Rao <mahesh.rao@altera.com>
> 
> Add support for HWMON commands in stratix10
> Asynchronous communication
> 

Please add more details to your commit message. What kind of HWMON 
commands, and why do you need it. If you ever have to debug using git 
bisect, you'll find these commit message very useful.

Dinh

