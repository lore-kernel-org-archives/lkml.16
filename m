Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A9339A8
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 10:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739095284; cv=none; b=mA5+VcOQmJIAo/rGykFTBXuedExJs36ufAMtC9Ol8ZC6hptzix49N5Szqp5r0jk1II+Zl8UPFhLayZNzePzxQRKzIXK0VQlfYZNnd5iIUXX8F1BvEkzUMLYdyFG2iRPzVs7cnPqs8xwSD/blGia6yJEdFsgh0tBrOj8HvDveET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739095284; c=relaxed/simple;
	bh=9cSbhneX97WdYtqTFiUpL4Xz+wowhgsJfRXIyo0XD/Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tXES2sduKrvplSze/4zcn/9lbx9V3dwhOPHYNho8W+AS+Ht3/GIKvZLjKAQPfs0/rWff9j1LHKXbwdvXy+Ag3k5cr8taygD0/ECfGAN4J3etqqQ7MQpS4HAleffC13LPIG/LFBqwKQ67Wge+jbt7Sqa/1HEfdB91Ck2XZV2G9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sE9os2oC; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sE9os2oC"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739095279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cSbhneX97WdYtqTFiUpL4Xz+wowhgsJfRXIyo0XD/Q=;
	b=sE9os2oCjn5wm8jnTVvYcVtsREUjUYFxqpeprhiDim4rUG/+AqdL+oucY7wOl6roCTG3KQ
	vbQFdqiU1SgzVUSSV8hHxiKNbVnT0cEfKjMaB7UXMbQLmd/KSeTBzTVeUBBBTzk03hWMlY
	puW18AQ0rIHwYhVZpFVgDNNdVqPd0qI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [RESEND PATCH] fadump: Use str_yes_no() helper in
 fadump_show_config()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <505dcbf1-c185-4bc3-9615-041dfd6344e5@csgroup.eu>
Date: Sun, 9 Feb 2025 11:01:06 +0100
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Baoquan He <bhe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B65D3E24-E34B-47DA-902F-8DD338CCFE09@linux.dev>
References: <20250209081704.2758-2-thorsten.blum@linux.dev>
 <505dcbf1-c185-4bc3-9615-041dfd6344e5@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT

On 9. Feb 2025, at 10:16, Christophe Leroy wrote:
> Le 09/02/2025 =C3=A0 09:17, Thorsten Blum a =C3=A9crit :
>> Remove hard-coded strings by using the str_yes_no() helper function.
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>=20
> Any reason for resending ? Your patch is not lost, see =
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=3D89400

Ah sorry, I missed this. It's sometimes hard to know the status of a
patch when it's not in next yet.

Thanks,
Thorsten=
