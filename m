Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB22135B3;
	Mon,  7 Apr 2025 02:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743994491; cv=none; b=KnPY8B3PFzcxIpCNNLSjyNujZOyL6UlUSF3cRYljiOm3S7am+fcCsn9ZkF9sMSPrAUWig34hvL2EpWe9NFLo1vB+O6+PvEUMN02GcE3AEfiYA+94CzQHb+jqsYrc+LvnqcrAOuU1AxsxRPyXYKjZF9kyHew8vEL0g8YyP9601es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743994491; c=relaxed/simple;
	bh=0XzdAfsuqWup1ZNHYyTYHBxogRUNXsUn8b+2R0DeDgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWV5braEunZdQEfu8MmHwRogd+8ye4zs7Hs4dHyMs2epo2ELCevuPajxmhRlE5Ef9W9UWuTA6J9q+9ZV1n3TqGdPaOmwKrZrCCTvkFIxVwYkpB03j5KD5Bqi+8EuWmlg8jXnXyRLp/67qzaelnztH5YCLdvOHiyj5LaAcME+b6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5yWq1SX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5yWq1SX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66639C4CEE3;
	Mon,  7 Apr 2025 02:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743994490;
	bh=0XzdAfsuqWup1ZNHYyTYHBxogRUNXsUn8b+2R0DeDgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5yWq1SXzQnG9At25GUsnfRhGcU98ES1vSVPn6QiK95oPlUTkEMFSy0Ao5nkgrxKp
	 RqrMDZa3QBk2HI1OmTg+rw8/UVDXN/R8w9c7t/rWRu9VOTPTRBt6ZxeqrMtJVUqlzg
	 LploIUzjDSgJ+DOMXffyXY5ZJM5BGS9e/8cK3Ii7nGBxpplTmF5aeow4no7k8Mg88d
	 AsTlcEWdRPf6oLk8vKitvxdWwxkkZX7YGBQEz0NRUC3Cd7fodcrPQ1N09S57/i9lDp
	 lZpUP/M9qnyfFArEjrMoCJvFdfYx30W262au6lXqV2s8Hy+d/r7dBSTLgftlr4WLrl
	 ZTsamkAp89y3w==
Date: Mon, 7 Apr 2025 02:54:47 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Slawomir Rosek <srosek@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	ukaszb@chromium.org
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: allow to build as
 module
Message-ID: <Z_M-d5L8FpSdy3ZT@google.com>
References: <20250328132612.511471-1-srosek@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328132612.511471-1-srosek@chromium.org>

On Fri, Mar 28, 2025 at 01:26:12PM +0000, Slawomir Rosek wrote:
> This allows to build ChromeOS EC communication protocol helpers as
> kernel module which is particularly useful for Android GKI (Generic
> Kernel Image) configuration. With this change the ChromeOS Platform
> (CONFIG_CHROME_PLATFORMS=y) can be enabled directly from the vendor
> kconfig fragment whithout additional configuration in gki_defconfig.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_proto: allow to build as module
      commit: ccf395bde6aeefac139f4f250287feb139e3355d

Thanks!
