Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD05130A54
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933328; cv=none; b=bQEncebw37OlpU3koUCsnBXJanpnlTBJtfsUiuOAb/X0JwJ1VtGQbpdzwE4kdlg5Hx5m7dEvuD/qjjK4va/2VW0vkKXw1ZrnKMbKt/ClOo4tbCOHcqjsmuMWj7HWlg1BDmrisB6QD+DNNprEg8YGkohQJ3X22EuANDkzo4eO4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933328; c=relaxed/simple;
	bh=xsBsO/sjs+IIJB50V0/7metlk79FzVIvViIS88ZGBNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzPpmHC2RZW7DILFcnAaYaQe1bzrOVbputp09rDDw4tMSrdWHpdZau92usGH42VM4QAb+clyWIKYWi5jgo5TDVODoQl9UCvllK5AaJlxJ4DcdH2XjHRaqGg3Mpy4dftVibxlf23HIbDxgO56QCsArSXHk4Dr317eCogSaNGGm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8MLGJA3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8MLGJA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85794C4CEE3;
	Tue, 29 Apr 2025 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745933328;
	bh=xsBsO/sjs+IIJB50V0/7metlk79FzVIvViIS88ZGBNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8MLGJA30OvJcZ56T+sH+cvJU1823GqqTvbfrlRw5shX+cJD+Y9glWt1Y8O9gRxb1
	 0NDtCRlGQDUlUqR3s/QdZw4tFQVEuuVlxSYWIlstvKjVDKuTCtqUTmx1doEJ2FUfdt
	 L35utiH5jGWr/WA7Bp4qur745g1/S7bdF7GWQCUYz5kV1MhBzSed7ARckyQcg5kn0Q
	 ZbX5S232aK0EY4TitrEafEdm9kDH5YZKdE3IDUzzvbB+pQpBVie3HCBjkTPnX8rk28
	 l0XUHexl3KLMCFHknyiYnf7tu7aWY1+qyk/9a7mcymVcXjKkUBQ9Lyjw94DoRlxsYT
	 Ys3VwAhw+omfw==
Date: Tue, 29 Apr 2025 21:28:41 +0800
From: Gao Xiang <xiang@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] erofs: remove unused enum type
Message-ID: <aBDUCS7rzDbB1OpZ@debian>
Mail-Followup-To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org,
	chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com,
	dhavale@google.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20250429075056.689570-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429075056.689570-1-lihongbo22@huawei.com>

On Tue, Apr 29, 2025 at 07:50:56AM +0000, Hongbo Li wrote:
> Opt_err is not used in EROFS, we can remove it.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang
