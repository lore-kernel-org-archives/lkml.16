Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4B371747
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124369; cv=none; b=OH4VTHRm/uvj+0drzO6PlKY6ZpRTa7M2yxPWZXM81FiG0NF6IhExNhK80q4YRMl/d7FP5kuXr4oczo79R8GqCqHxMpd+ZSI2yJm0UZVGgF4EOnlHQibHAtAFsUbk/LFbS3iE5VcZOpMhanV7IJgyLynuLVt1nKp+PMRU/lAt1q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124369; c=relaxed/simple;
	bh=hIkf0PFQT6Xc9qpqiOBy2ebjmbUnvVFbDBVfpMhay2Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jA8BmKG7efJAuFjx7W5Qg+3sSZh7sr+0GU8pdLFLZC7gDFU3ksXtBq/DWKWokBzibdHFHRxS/1bHjZB87C/h3Mt3gM8XQUkQURnzAi1MRgKjiuXbgH36KYHR2z+40YVwhPOC7nzkbD/LZoE05ITUt5byUtbtbbNtyD50hDieo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=jzj1RZKk; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=OmpYaJ+y; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="jzj1RZKk";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="OmpYaJ+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751124364; x=1751729164;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=BOIeB1Vb/vFEPkAxZTIsJPYgb2yRlv4ViGfG7pUkR5Q=;
	b=jzj1RZKkozDCKaPDZKl2tY3NEVhZ5/5+gJY6UuOo7KCRvZPaOp5cMvvcNeXMnhNx/LyNWnsA4HQzP
	 CHGt5J1WQd/TYM7s0YypOyrv0d8zfH1BE1RWvKAwq8O9y4tKDL5F9st5iR6IjUj82z6BQtV7NEvedO
	 qemC51DxRaFd3M64TE/HUDX5PBaPbOWaJj+SA84VH5w4JAyrwhadcAYNkvm7xUjOQWg8vmq+2Hio3c
	 NnApClLRMPNMEYOAjLSAy3MG4RsVX02yHVEWE8xIZ0BRIF0qd9q7FlLJKqvHhsj3qfjDMCRokcr7O/
	 NIgsCcXYBD5WfhctoYFOduUnIc3ApFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751124364; x=1751729164;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=BOIeB1Vb/vFEPkAxZTIsJPYgb2yRlv4ViGfG7pUkR5Q=;
	b=OmpYaJ+yiuelLE7861I59SxCB2SAJmAhnBMXUcSkE86lwdd2flmb8fHBnQtIcPziG463g7Ne/0/PM
	 QB47pBlDw==
X-HalOne-ID: 3315bb22-5434-11f0-8a91-29b2d794c87d
Received: from smtpclient.apple (host-90-233-200-0.mobileonline.telia.com [90.233.200.0])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 3315bb22-5434-11f0-8a91-29b2d794c87d;
	Sat, 28 Jun 2025 15:26:03 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v8 3/4] rust: add support for NUMA ids in allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aF_eLTlirxl-1jPP@pollux>
Date: Sat, 28 Jun 2025 17:25:52 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <61DAD282-B00A-4809-B579-3F47F4781BBC@konsulko.se>
References: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
 <20250628102611.2542910-1-vitaly.wool@konsulko.se> <aF_eLTlirxl-1jPP@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 28, 2025, at 2:21=E2=80=AFPM, Danilo Krummrich =
<dakr@kernel.org> wrote:
>=20
> On Sat, Jun 28, 2025 at 12:26:11PM +0200, Vitaly Wool wrote:
>> +/// Non Uniform Memory Access (NUMA) node identifier
>> +#[derive(Clone, Copy, PartialEq)]
>> +pub struct NumaNode(i32);
>> +
>> +impl NumaNode {
>> +    /// create a new NUMA node identifer (non-negative integer)
>> +    /// returns EINVAL if a negative id is specified
>> +    pub fn new(node: i32) -> Result<Self> {
>> +        if node < 0 {
>> +            return Err(EINVAL);
>> +        }
>=20
> Should we also check for MAX_NUMNODES?

Good point, thanks.

>=20
>> +        Ok(Self(node))
>> +    }
>> +}
>=20
> <snip>
>=20
>> +    /// Re-allocate an existing memory allocation to satisfy the =
requested `layout` and
>> +    /// optionally a specific NUMA node request to allocate the =
memory for.
>=20
> It's not an Option anymore, so we may want to drop 'optionally'. Also =
please
> leave an empty line here.
>=20
>> +    /// Systems employing a Non Uniform Memory Access (NUMA) =
architecture contain
>> +    /// collections of hardware resources including processors, =
memory, and I/O buses,
>> +    /// that comprise what is commonly known as a NUMA node.
>> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which =
is a non-negative
>> +    /// integer if a node needs to be specified, or NUMA_NO_NODE if =
the caller doesn't care.
>=20
> Please also explain what happens when the NumaNode changes between =
calls to
> realloc_node().
>=20
> Does it have to remain the same NumaNode? Do we need a safety =
requirement for
> that?

Since we don=E2=80=99t implement that logic, we trust the C part. The =
current implementation will refuse to realloc for a different node, and =
I believe that is the right thing to do because transferring an =
allocation to a different node doesn=E2=80=99t go well with the concept =
of simple adjustment of the allocation size.

Do you believe it is necessary to explicitly state it here in the =
comments?

<snip>=
