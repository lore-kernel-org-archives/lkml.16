Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1629B1D88DB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242210; cv=none; b=c6ykvaAkd+odfhAJorVoQt/o6vRtzJdLQYIPggqfbikwTgY5HwacM1QSYZqgVp1CPt8sxr/HnfTeov1harJeYM4/uaPfo4YXht1iXsviOworVvc3SWOz/VhG62H5vP2P/kR9LwO1u6EsRrgH/wLvL3IIybx59qapzTA0EiTVwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242210; c=relaxed/simple;
	bh=+Up349YLSg8MuPlubCkn8JkyDzqkqi4ZAU9amDg1JZY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHNwwSOtZs5nBiT9oMuYB2rToBoRXFK7aeuN691fFnal8dptHI6Zpr8VcykNxPBYZ0T+Es5q4dv62qEC9e7nIBIh41sJB5iB7jRwc6LKEzsStQnCcOwSkFQ5QZb5e9dvs3lT22Hf5A9ibkqEQ1rzz0iMr6WadRZFxSF0Z3wCGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldiUcwj7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldiUcwj7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C7FC4CED2;
	Thu, 30 Jan 2025 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738242209;
	bh=+Up349YLSg8MuPlubCkn8JkyDzqkqi4ZAU9amDg1JZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ldiUcwj7+mlSryfXQ8CyCeNyv/WKDJecIQgOcj4+6JQ8JSDmf9ZfDCprPA08mxtps
	 FwIu5eu4yozoAuxHIC8Jd7Mnnj5UZak3eJInHEfb7bh73AT1fYR3YLI/0txrgrH3Kx
	 V/M4cuVl9XJoNwXaQ9DoXPvDmyKEICL8fh7E6t5BtizTcaZxpC+o+seRccoDWjgiUz
	 uf1DqVtPBPNchEc9r6wjZhGd/MqYfKKBwxG5eDd2KHOhdYQs+qVDjn+EX0EPw0HaRf
	 4bYjvApIwjR7bF7LzDN8/qWt56reYpajnBKV10GV8tIHIHhQFRE6f+zXcdJXntdFle
	 baumsAwstZNEg==
Date: Thu, 30 Jan 2025 14:03:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] tests/acpi: virt: allow acpi table changes for
 a new table: HEST
Message-ID: <20250130140324.06cdd4bf@foz.lan>
In-Reply-To: <20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
	<20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 29 Jan 2025 16:03:28 +0100
Igor Mammedov <imammedo@redhat.com> escreveu:

> On Wed, 29 Jan 2025 09:04:08 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The DSDT table will also be affected by such change.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> move it right before the patch that would actually make changes to tables (10/13)

Table changes happens on two patches:

- patch 03/13: acpi/ghes: add a firmware file with HEST address

	HEST table was added here

- patch 10/13: arm/virt: Wire up a GED error device for ACPI / GHES 

	DSDT changes happen here.

If the idea is to avoid make check to fail between those two patches,
we need either to split them on 4 patches (one before/one after each
change) or do like I did on this series: whitelist before patch 3,
update after patch 10.

Regards,
Mauro

> 
> 
> > ---
> >  tests/data/acpi/aarch64/virt/HEST           | 0
> >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> >  2 files changed, 2 insertions(+)
> >  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> > 
> > diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8bf4..46298e38e7b8 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/aarch64/virt/HEST",
> > +"tests/data/acpi/aarch64/virt/DSDT",  
> 
> the list in not complete so 'make check-qtest' still fails
> [12/13] has complete list of changed files
> 



Thanks,
Mauro
