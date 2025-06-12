Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081701A304A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732089; cv=none; b=tLurwaUcArnuGnrYvRP9Ps2LNPLu9vFwabAtmzxHXh7N3RSwqGPiIFIutQ8pAgP0TuQE6MjFA6rTy3QU8Hai21jMuDrYz1xtzgcBRsw2WUkYP4MZy6hmGCkgtNFLSeRnCOMgl2iNtQvmhDIQTzj8/x+8AyQoftf9o64+Pbf7VZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732089; c=relaxed/simple;
	bh=c8Ix91wrzFGnsIKnEJ76g/AFhCOhdU7RNRauJOy8nRk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LjgOAdfSdXB/bvmpyDsP5fIzk4J3VoFFMbbfecR7n1o/vGU2BEkKWxNiKPOH1BtT5bZctqjMYl11nsFNx/S+F6DxSkw2/sGNWSZFDqCaWx32PL6gsAwIO9gcOwqQlz9D8WP+fldLCF5idBvWPzeOFSAuZAhVAIRjZIGbiUcpgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DQAQkgj4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=brIy1qbS; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DQAQkgj4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="brIy1qbS"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id DA4E2138032B;
	Thu, 12 Jun 2025 08:41:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 08:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749732086;
	 x=1749818486; bh=vdZKbGDbpvt9W2XJe9j+di/nQDtbx+SBBwgfEySjMIo=; b=
	DQAQkgj48q1fN+wl4EKziOQKsTJcdhS9YQRtR5uL7TwKyPl5nr74rOl6JuqrivTl
	xFEMmSs/NMKWXknlL4ddeXFwiVEMXbdROoHdwiAOBrtmYhmEu5pDV60kTSqE/Q54
	Hl1yySylKzAE8kDvGIR79PdDc7TewWAKW0MWsxiusksoIaiFsBLr7xYXrYYYmdTD
	Dz2jiZdbaNVtkSie7T9bCkgvzRQVCLSrAZwKDRywHMO5MMZx6DPWjoVOjOWw3gYX
	tVkRPspdQUzohQkzwRWVB5pX9Q1gSSr6doCJee98q+BJjyYQ/3ta1N4c87cW93lM
	jDRtRllW1Y7uCQm81MTvFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749732086; x=
	1749818486; bh=vdZKbGDbpvt9W2XJe9j+di/nQDtbx+SBBwgfEySjMIo=; b=b
	rIy1qbSVX9cIdrC0k4EA6tgRSAfFq078dvj9lxYBCA/XBbzrK6KqLFwynJe/8QCm
	prWvZ3azO7737RYKaiSVm5VRwp7SrX0wyJ86/BrLPrW8Hs58stSpC7QH/3B7x5wG
	T5UzgjZZlhrkuEyVubSEOaT58X0AEU/iezzMORVujYCgJCrAZE5WplnSR2Yosvqq
	1EYLWO6jAywBQeve1NJbrpDMRtHp7R1fxmwNhj9d7TKm3h/42Ued3vHe1chWQoe0
	C1QuMo7YvYpAsT/n0g4HxbwtM4LvfaxKWDJSIMfmCVU8IAIBvQvZAjxrAscTnktk
	hLJIpr64Qvnzb/e9sHgRA==
X-ME-Sender: <xms:9cpKaMM3lyjzhNeqdJ6rhZn8JNUVqXAQERnKGgKGAWaaNY6AhS0j0w>
    <xme:9cpKaC8MNu61LjDgo09TeGsL8n1d7zLmWWb50NU9hqly26GAJjT_NhY4ySyjZBHfD
    ScFPD7wyi122G66G_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeekvdefgfeigedtuddujeduueekleefuedvtdeh
    fefhjefhvddtkedufeekjefhkeenucffohhmrghinhepghhouggsohhlthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhi
    vggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrh
    hsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithht
    sehgohhoghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomh
    dprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9cpKaDTCqfC60KXO5wbhTldgUaHUkmBC-LRuw0hZjg2X3Myb-PBjSQ>
    <xmx:9cpKaEvUlWHhyoi0aE_fmzCgHWke3NEy1QlNCMCbBIp0KAd93Jc7UQ>
    <xmx:9cpKaEeK7iRkd4twcPiE5K7_-PjVi-v-NAS3CEPDACiHL2OT8KOung>
    <xmx:9cpKaI1GJ5ZyZE9iGUHczX0TvgNbfcbvch_gJUcRGO2tu9MkXHm6OA>
    <xmx:9spKaBuZGBOokQNR9tOfVXyogu175bYrQExiZ-CRtIEp56oQ_V-X-9az>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C9BED700062; Thu, 12 Jun 2025 08:41:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7abef826b1a41757
Date: Thu, 12 Jun 2025 14:40:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux <linux@treblig.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <4a81fc44-7c93-49d1-891b-dae11cd5e74a@app.fastmail.com>
In-Reply-To: <f4e42ca9-d6f2-401b-9a53-d3b41915c6a0@ideasonboard.com>
References: <20250610092737.2641862-1-arnd@kernel.org>
 <f4e42ca9-d6f2-401b-9a53-d3b41915c6a0@ideasonboard.com>
Subject: Re: [PATCH] drm: omapdrm: reduce clang stack usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jun 12, 2025, at 09:58, Tomi Valkeinen wrote:
> On 10/06/2025 12:27, Arnd Bergmann wrote:
>>  
>> -static void dispc_restore_context(struct dispc_device *dispc)
>> +static noinline_for_stack void dispc_restore_context(struct dispc_device *dispc)
>>  {
>>  	int i, j;
>>  
>
> While I don't think this causes any harm, but... What's going on here?
> If I compile with gcc (x86 or arm), I see stack usage in few hundreds of
> bytes. If I compile with LLVM=1, the stack usage jumps to over a thousand.
>
> Is clang just broken? I don't see anything special with
> dispc_restore_context() or dispc_runtime_resume(), so is this same thing
> happening all around the kernel, and we need to sprinkle noinlines
> everywhere?
>
> Or do we get some extra debugging feature enabled only on clang with
> allmodconfig, and that is eating the stack?

There is no general answer here, but a combination of multiple
effects going on at the same time throughout the kernel, which lead
to clang observing excessive stack usage in some files when gcc
does not:

- both compilers have a number of corner cases where they run off
  and do something crazy for unusual input (usually crypto code),
  but since gcc has more users, most files that trigger only gcc
  already have workarounds in place, while the ones that trigger
  with clang are still missing them

- The inlining algorithm works the opposite way on clang vs gcc,
  while gcc always starts inlining leaf functions into their callers
  and does this recursively, clang starts with global functions
  and inlines its direct callees first. If you have deeply nested
  static functions that could all be inlined, both stop at some
  point, but the resulting object code looks completely different,
  and the stack usage is a symptom of this. I've added 'noinline'
  for some of the cases like this where I know both result in
  the same (harmless) stack usage through the call chain, but
  only clang warns about it.

- clang has previously had bugs where it tracks the lifetime of
  stack variables incorrectly, so multiple variables that
  should share the same stack slot won't. Some of these are
  fixed now, others are a result of the different inlining, and
  some others are likely still bugs we should fix in clang

- CONFIG_KMSAN disables some optimizations that are required
  for reducing stack usage, and at the moment this is only
  implemented in clang but not gcc.

- CONFIG_KASAN has some similar issues as KMSAN but is not
  quite as bad here.

- CONFIG_KASAN_STACK tends to use more stack with clang than gcc
  because of implementation choices around how hard it should
  try to detect array overflows. This could be changed by having
  clang make similar decisions to gcc here, but for now we just
  require using CONFIG_EXPERT=y to enable KASAN_STACK on clang.

I have managed to produce a testcase for this file that shows
how clang produces huge stack usage when gcc does not,
in this case it seems to be triggered by -fsanitize=kernel-address

https://godbolt.org/z/TT88zPYf6


      Arnd
