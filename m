Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CCA41
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825449; cv=none; b=JDRiR956WtMwgDXc8ACrt2qo7ioyGNqOkmrHO2kCtPLNI9vibVVpo0MGgOQ7ydK8NGzAAwqpDb0jyFxVhx8iHBFTQ6vN7Nn2bi2bK2b5VZnOVeHiIMbEB1OmCVtJwRHHApd1ZEuT1HMtYXn3p6KLg09gxXeB0k8+fGpDxlElEGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825449; c=relaxed/simple;
	bh=7sC1QN1fMZHI/93BJYZBh6BWm9rOd2/A9fAV0QjBoY4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qhnboN8LhpouPhTwlWCZx3LWsAbq1Al/LZDebtTceDlCM0lIeSW1wVUFLxq9lmzLjxlKvqa2D8Dpyw4Y+TLeg2saJfAtBK9wUdONc4CGdJBS+nsqm4aW7LtHKG1SvWjcCUqjnWd0IP44zo0LGPNZwhnQfozQKpFSBGMQT3AoXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fhg5n7uM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fhg5n7uM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C0DC4CEE4;
	Fri,  9 May 2025 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746825448;
	bh=7sC1QN1fMZHI/93BJYZBh6BWm9rOd2/A9fAV0QjBoY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fhg5n7uMeHlZypqQIqYn9U5IRKKz6PBQ24S8zlTDL5Jt901kRzl8jLLjzQEt1UVWq
	 p3QSsFBI2UzheAnLeH7Y578p0qpOA+NKkpZxHcZtvBNsBewxBM+XkyOm5OtapAHBWj
	 ya3VWqCu7k4Ben+s2XZfWz3qVr21Zdaj4p8Z8mdY=
Date: Fri, 9 May 2025 14:17:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Boian Bonev <bbonev@devuan.org>
Cc: linux-kernel@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Yang
 Yang <yang.yang29@zte.com.cn>, Wang Yaxin <wang.yaxin@zte.com.cn>, Kun
 Jiang <jiang.kun2@zte.com.cn>, xu xin <xu.xin16@zte.com.cn>
Subject: Re: Bug 220102 - struct taskstats breaks backward compatibility
 since version 15
Message-Id: <20250509141727.19b616d1c4a549d01656e5dd@linux-foundation.org>
In-Reply-To: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
References: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 May 2025 21:35:59 +0300 Boian Bonev <bbonev@devuan.org> wrote:

> Hello!
> 
> Since version 15 (TASKSTATS_VERSION=15) the new layout of the structure
> adds fields in the middle of the structure, rendering all old software
> incompatible with newer kernels and software compiled against the new
> kernel headers incompatible with older kernels.

Yikes.  Yes, we did change the versioning but such an incompatibility
seems undesirable and unnecessarily disruptive.

> I think that change has to be reverted and the added fields moved to
> the end of the structure. Also bumping the version to 16 after the
> change is a good idea in order for the userspace software to be able to
> distinguish the different formats.

Yes, please send along the patch.  Include the suitable Fixes: and we
can backport this into the affected -stable kernels.

> https://bugzilla.kernel.org/show_bug.cgi?id=220102

