Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C5200BA9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580216; cv=none; b=f4LWEaHMbgEes3QOP8CnJZcOb8Z3OALr3n1ER4/ral9G1ercEJ7ytWXKX9gJGOfaTJEg006odorKeL+hgMl8c7xPNi3yxN6rzvkGmRFL75xiUWUYxVlumk1JvdJ2zIpdgDmzVZjqJQ2UGp1h70FhHhCTaNFS/nuRjuo34Ev55GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580216; c=relaxed/simple;
	bh=6Gku+OxZtx1iIVCtDG2FF9RHz0J4dQ/SCQFGW64ivY0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEIPQBbDiXzeG2AlyCrNqAbze60r317wf5MzbQ+WImm3Rz0B8m4nWTFav9goNMhwuGK8Avn5nbR6JMd5sJrNDIw/rdJX1LvSaKpjI7njy6yO2jp7zr3oWMMMQ2UrJIKVVqBKScyb3o+8wy9MiV8KiqBO4E796Z8IZpl/kW5/vqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ymjzx2xtgz6L4xr;
	Mon,  3 Feb 2025 18:54:21 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F2FB140B73;
	Mon,  3 Feb 2025 18:56:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:56:52 +0100
Date: Mon, 3 Feb 2025 10:56:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, John Snow
	<jsnow@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 14/14] scripts/ghes_inject: add a script to generate
 GHES error inject
Message-ID: <20250203105651.00001a4e@huawei.com>
In-Reply-To: <80858743b6fd67db3f48ac8cb466bbcde5b11132.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<80858743b6fd67db3f48ac8cb466bbcde5b11132.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 31 Jan 2025 18:42:55 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Using the QMP GHESv2 API requires preparing a raw data array
> containing a CPER record.
> 
> Add a helper script with subcommands to prepare such data.
> 
> Currently, only ARM Processor error CPER record is supported, by
> using:
> 	$ ghes_inject.py arm
> 
> which produces those warnings on Linux:
> 
> [  705.032426] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error
> [  774.866308] {4}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
> [  774.866583] {4}[Hardware Error]: event severity: recoverable
> [  774.866738] {4}[Hardware Error]:  Error 0, type: recoverable
> [  774.866889] {4}[Hardware Error]:   section_type: ARM processor error
> [  774.867048] {4}[Hardware Error]:   MIDR: 0x00000000000f0510
> [  774.867189] {4}[Hardware Error]:   running state: 0x0
> [  774.867321] {4}[Hardware Error]:   Power State Coordination Interface state: 0
> [  774.867511] {4}[Hardware Error]:   Error info structure 0:
> [  774.867679] {4}[Hardware Error]:   num errors: 2
> [  774.867801] {4}[Hardware Error]:    error_type: 0x02: cache error
> [  774.867962] {4}[Hardware Error]:    error_info: 0x000000000091000f
> [  774.868124] {4}[Hardware Error]:     transaction type: Data Access
> [  774.868280] {4}[Hardware Error]:     cache error, operation type: Data write
> [  774.868465] {4}[Hardware Error]:     cache level: 2
> [  774.868592] {4}[Hardware Error]:     processor context not corrupted
> [  774.868774] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error
> 
> Such script allows customizing the error data, allowing to change
> all fields at the record. Please use:
> 
> 	$ ghes_inject.py arm -h
> 
> For more details about its usage.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for examples.  Given my poor python skills take this one with
a pinch of salt.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
