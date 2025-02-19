Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4170923CEE5;
	Wed, 19 Feb 2025 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739997642; cv=none; b=VZqIeGgq+YSYUGqlTF7KwSBVSKcJSj/p+md6QiyLfzAWBr3368+5QkoV91WQqkOBU1oi8EaiWY4E5/ufV4v3OjuhjQ4Sk1fSPsLP/QGe/i5h1UDxw+M4zvV6ksOyKDFZ/GSt0PPqpjfKb6BjIC4ej4cAwrwY1ZZ9hDW3gLWquM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739997642; c=relaxed/simple;
	bh=nQ1qAZAXdR8MIqWqbrZLYbvTyGGnrrSbyW3Dq2qoXUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=F6iLpqVK0yFEgvBwLkvW/gezY9L6IiIC44b2M5SlAesxo2z4E2qwYLxkuKRoodGfBexAGaHRXikiNzPk4aULofY82u3bdZH2g3Cols6+PpQLe0uCfbu0c49rlU7W5ZvTK8MqK0wrUFvcTvgib+OSh8+ECrdcyPVJXfENqQfnuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=sajfAVRh; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="sajfAVRh"
Received: by linux.microsoft.com (Postfix, from userid 1158)
	id C83F42043DE3; Wed, 19 Feb 2025 12:40:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C83F42043DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739997639;
	bh=Ho+YSfbJBFTzhQ/HhGnAs/MaYV1kmkQawSMKnWR/BNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sajfAVRhZD02jyAketfSH2imHZNf7x7g+yx+lis9xzXlsCLah1SYNJf/txI9ZNPPj
	 lnb48wwrN4Gs0coy8M2HIOvIyY2ZmZvGB734SctLpU57MNgNZk/glC3gIoR31DAwey
	 v04iSNECCpF/haqx7mpq1pCLKB78E0yXkLu6Pwzg=
From: Hardik Garg <hargar@linux.microsoft.com>
To: gregkh@linuxfoundation.org
Cc: akpm@linux-foundation.org,
	broonie@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	hargar@microsoft.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lkft-triage@lists.linaro.org,
	patches@kernelci.org,
	patches@lists.linux.dev,
	pavel@denx.de,
	rwarsow@gmx.de,
	shuah@kernel.org,
	srw@sladewatkins.net,
	stable@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	torvalds@linux-foundation.org
Subject: Re: [PATCH 6.12] 6.12.16-rc1 review
Date: Wed, 19 Feb 2025 12:40:39 -0800
Message-Id: <1739997639-4392-1-git-send-email-hargar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20250219082601.683263930@linuxfoundation.org>
References: <20250219082601.683263930@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The kernel, bpf tool, perf tool, and kselftest builds fine for v6.12.16-rc1 on x86 and arm64 Azure VM.

Kernel binary size for x86 build:
text      data      bss      dec       hex      filename
27754094  17709070  6397952  51861116  317567c  vmlinux

Kernel binary size for arm64 build:
text      data      bss     dec       hex      filename
36379568  14992369  1052816 52424753  31ff031  vmlinux

Tested-by: Hardik Garg <hargar@linux.microsoft.com>




Thanks,
Hardik
