Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269C17A317;
	Thu,  5 Jun 2025 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139013; cv=none; b=WhbVkhY60a4K+Zz8NZHT/mylHO5k/0vIsSu108B4TlalWIQlXb9Epfk72sZoUzRwc8UHZyU0THzDAbdoWE0n8yiwdSoUyMLFOUST4xETJl0q5AtSLAJK3PFE+qzvfOuHdYiW2BiRNSbLrHG9OzoL47bzQMxH370PaQ2NBTi29mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139013; c=relaxed/simple;
	bh=Zo9uYs5Z3ukTr/MIHIkIuuKvO/k99thBiMqKFTBbAHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VC1AWBTzxB1UGT2pj79Q2o/7s8zcJDmUKWpIgMB8N/PXeJYtqFTKGiqkuEC8ZioGeFGxpQIVqOzu673bBjOFURvOBf/P2fFsxGXBQwcbeyOFv98mPvDJXIglYdnEnR5lMaZcHaUMRyWOvpTdJ/b4yeIawhjySPX+jg3h1pnq3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCj/cSMp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCj/cSMp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125E4C4CEE7;
	Thu,  5 Jun 2025 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139012;
	bh=Zo9uYs5Z3ukTr/MIHIkIuuKvO/k99thBiMqKFTBbAHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UCj/cSMpGwootQXe/5z9Raovcuekn6U3esMSO9oZ3PIP8fYzFDGAhxS1xALrQjuX1
	 DDf9BvvysW/TfNmYMhI0yoP2k3zmxmhKH1qJYJimQvlkQXMNng+DrOR/O7arkl5u5a
	 nJTHkI+CkI6tjdDjXkh50D9v0YNkQPvICGoBaAuHq+9UFgKJeQop3xYSGZ/uSo+ahE
	 4DoxdTmttBy7Vgwnumqm8ltejNeMVI6N8ewqKyq7WTfNs3ltDVKbj+IsiJzSBWwAiA
	 MKNWTBfKPqXvlZMxMl1GU9hvJrm5iRchlyoNinaCjlH2PcKlic1g31hpKT/W3Vjk6K
	 Bsbrn2RE9J70A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org,  jasonmiu@google.com,  graf@amazon.com,
  changyuanl@google.com,  rppt@kernel.org,  dmatlack@google.com,
  rientjes@google.com,  corbet@lwn.net,  rdunlap@infradead.org,
  ilpo.jarvinen@linux.intel.com,  kanie@linux.alibaba.com,
  ojeda@kernel.org,  aliceryhl@google.com,  masahiroy@kernel.org,
  akpm@linux-foundation.org,  tj@kernel.org,  yoann.congal@smile.fr,
  mmaurer@google.com,  roman.gushchin@linux.dev,  chenridong@huawei.com,
  axboe@kernel.dk,  mark.rutland@arm.com,  jannh@google.com,
  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
In-Reply-To: <20250515182322.117840-9-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-9-pasha.tatashin@soleen.com>
Date: Thu, 05 Jun 2025 17:56:43 +0200
Message-ID: <mafs034cetc5g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Introduce the framework within LUO to support preserving specific types
> of file descriptors across a live update transition. This allows
> stateful FDs (like memfds or vfio FDs used by VMs) to be recreated in
> the new kernel.
>
> Note: The core logic for iterating through the luo_files_list and
> invoking the handler callbacks (prepare, freeze, cancel, finish)
> within luo_do_files_*_calls, as well as managing the u64 data
> persistence via the FDT for individual files, is currently implemented
> as stubs in this patch. This patch sets up the registration, FDT layout,
> and retrieval framework.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  drivers/misc/liveupdate/Makefile       |   1 +
>  drivers/misc/liveupdate/luo_core.c     |  19 +
>  drivers/misc/liveupdate/luo_files.c    | 563 +++++++++++++++++++++++++
>  drivers/misc/liveupdate/luo_internal.h |  11 +
>  include/linux/liveupdate.h             |  62 +++
>  5 files changed, 656 insertions(+)
>  create mode 100644 drivers/misc/liveupdate/luo_files.c
>
> diff --git a/drivers/misc/liveupdate/Makefile b/drivers/misc/liveupdate/Makefile
> index df1c9709ba4f..b4cdd162574f 100644
> --- a/drivers/misc/liveupdate/Makefile
> +++ b/drivers/misc/liveupdate/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y					+= luo_core.o
> +obj-y					+= luo_files.o
>  obj-y					+= luo_subsystems.o
[...]
> diff --git a/drivers/misc/liveupdate/luo_files.c b/drivers/misc/liveupdate/luo_files.c
> new file mode 100644
> index 000000000000..953fc40db3d7
> --- /dev/null
> +++ b/drivers/misc/liveupdate/luo_files.c
> @@ -0,0 +1,563 @@
[...]
> +struct luo_file {
> +	struct liveupdate_filesystem *fs;
> +	struct file *file;
> +	u64 private_data;
> +	bool reclaimed;
> +	enum liveupdate_state state;
> +	struct mutex mutex;
> +};
> +
> +/**
> + * luo_files_startup - Validates the LUO file-descriptors FDT node at startup.
> + * @fdt: Pointer to the LUO FDT blob passed from the previous kernel.
> + *
> + * This __init function checks the existence and validity of the
> + * '/file-descriptors' node in the FDT. This node is considered mandatory. It

Why is it mandatory? Can't a user just preserve some subsystems, and no
FDs?

> + * calls panic() if the node is missing, inaccessible, or invalid (e.g., missing
> + * compatible, wrong compatible string), indicating a critical configuration
> + * error for LUO.
> + */
> +void __init luo_files_startup(void *fdt)
> +{
> +	int ret, node_offset;
> +
> +	node_offset = fdt_subnode_offset(fdt, 0, LUO_FILES_NODE_NAME);
> +	if (node_offset < 0)
> +		panic("Failed to find /file-descriptors node\n");
> +
> +	ret = fdt_node_check_compatible(fdt, node_offset,
> +					LUO_FILES_COMPATIBLE);
> +	if (ret) {
> +		panic("FDT '%s' is incompatible with '%s' [%d]\n",
> +		      LUO_FILES_NODE_NAME, LUO_FILES_COMPATIBLE, ret);
> +	}
> +	luo_fdt_in = fdt;
> +}
> +
> +static void luo_files_recreate_luo_files_xa_in(void)
> +{
> +	int parent_node_offset, file_node_offset;
> +	const char *node_name, *fdt_compat_str;
> +	struct liveupdate_filesystem *fs;
> +	struct luo_file *luo_file;
> +	const void *data_ptr;
> +	int ret = 0;
> +
> +	if (luo_files_xa_in_recreated || !luo_fdt_in)
> +		return;
> +
> +	/* Take write in order to gurantee that we re-create list once */

Typo: s/gurantee/guarantee

> +	down_write(&luo_filesystems_list_rwsem);
> +	if (luo_files_xa_in_recreated)
> +		goto exit_unlock;
> +
> +	parent_node_offset = fdt_subnode_offset(luo_fdt_in, 0,
> +						LUO_FILES_NODE_NAME);
> +
> +	fdt_for_each_subnode(file_node_offset, luo_fdt_in, parent_node_offset) {
> +		bool handler_found = false;
> +		u64 token;
> +
> +		node_name = fdt_get_name(luo_fdt_in, file_node_offset, NULL);
> +		if (!node_name) {
> +			panic("Skipping FDT subnode at offset %d: Cannot get name\n",
> +			      file_node_offset);

Should failure to parse a specific FD really be a panic? Wouldn't it be
better to continue and let userspace decide if it can live with the FD
missing?

> +		}
> +
> +		ret = kstrtou64(node_name, 0, &token);
> +		if (ret < 0) {
> +			panic("Skipping FDT node '%s': Failed to parse token\n",
> +			      node_name);
> +		}
> +
> +		fdt_compat_str = fdt_getprop(luo_fdt_in, file_node_offset,
> +					     "compatible", NULL);
> +		if (!fdt_compat_str) {
> +			panic("Skipping FDT node '%s': Missing 'compatible' property\n",
> +			      node_name);
> +		}
> +
> +		data_ptr = fdt_getprop(luo_fdt_in, file_node_offset, "data",
> +				       NULL);
> +		if (!data_ptr) {
> +			panic("Can't recover property 'data' for FDT node '%s'\n",
> +			      node_name);
> +		}
> +
> +		list_for_each_entry(fs, &luo_filesystems_list, list) {
> +			if (!strcmp(fs->compatible, fdt_compat_str)) {
> +				handler_found = true;
> +				break;
> +			}
> +		}
> +
> +		if (!handler_found) {
> +			panic("Skipping FDT node '%s': No registered handler for compatible '%s'\n",
> +			      node_name, fdt_compat_str);

Thinking out loud here: this means that by the time of first retrieval,
all file systems must be registered. Since this is called from
luo_do_files_finish_calls() or luo_retrieve_file(), it will come from
userspace, so all built in modules would be initialized by then. But
some loadable module might not be. I don't see much of a use case for
loadable modules to participate in LUO, so I don't think it should be a
problem.

> +		}
> +
> +		luo_file = kmalloc(sizeof(*luo_file),
> +				   GFP_KERNEL | __GFP_NOFAIL);
> +		luo_file->fs = fs;
> +		luo_file->file = NULL;
> +		memcpy(&luo_file->private_data, data_ptr, sizeof(u64));

Why not make sure data_ptr is exactly sizeof(u64) when we parse it, and
then simply do luo_file->private_data = (u64)*data_ptr ?

Because if the previous kernel wrote more than a u64 in data, then
something is broken and we should catch that error anyway.

> +		luo_file->reclaimed = false;
> +		mutex_init(&luo_file->mutex);
> +		luo_file->state = LIVEUPDATE_STATE_UPDATED;
> +		ret = xa_err(xa_store(&luo_files_xa_in, token, luo_file,
> +				      GFP_KERNEL | __GFP_NOFAIL));

Should you also check if something is already at token's slot, in case
previous kernel generated wrong tokens or FDT is broken?

> +		if (ret < 0) {
> +			panic("Failed to store luo_file for token %llu in XArray: %d\n",
> +			      token, ret);
> +		}
> +	}
> +	luo_files_xa_in_recreated = true;
> +
> +exit_unlock:
> +	up_write(&luo_filesystems_list_rwsem);
> +}
> +
[...]
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index 7a130680b5f2..7afe0aac5ce4 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -86,6 +86,55 @@ enum liveupdate_state  {
>  	LIVEUPDATE_STATE_UPDATED = 3,
>  };
>  
> +/* Forward declaration needed if definition isn't included */
> +struct file;
> +
> +/**
> + * struct liveupdate_filesystem - Represents a handler for a live-updatable
> + * filesystem/file type.
> + * @prepare:       Optional. Saves state for a specific file instance (@file,
> + *                 @arg) before update, potentially returning value via @data.
> + *                 Returns 0 on success, negative errno on failure.
> + * @freeze:        Optional. Performs final actions just before kernel
> + *                 transition, potentially reading/updating the handle via
> + *                 @data.
> + *                 Returns 0 on success, negative errno on failure.
> + * @cancel:        Optional. Cleans up state/resources if update is aborted
> + *                 after prepare/freeze succeeded, using the @data handle (by
> + *                 value) from the successful prepare. Returns void.
> + * @finish:        Optional. Performs final cleanup in the new kernel using the
> + *                 preserved @data handle (by value). Returns void.
> + * @retrieve:      Retrieve the preserved file. Must be called before finish.
> + * @can_preserve:  callback to determine if @file with associated context (@arg)
> + *                 can be preserved by this handler.
> + *                 Return bool (true if preservable, false otherwise).
> + * @compatible:    The compatibility string (e.g., "memfd-v1", "vfiofd-v1")
> + *                 that uniquely identifies the filesystem or file type this
> + *                 handler supports. This is matched against the compatible
> + *                 string associated with individual &struct liveupdate_file
> + *                 instances.
> + * @arg:           An opaque pointer to implementation-specific context data
> + *                 associated with this filesystem handler registration.
> + * @list:          used for linking this handler instance into a global list of
> + *                 registered filesystem handlers.
> + *
> + * Modules that want to support live update for specific file types should
> + * register an instance of this structure. LUO uses this registration to
> + * determine if a given file can be preserved and to find the appropriate
> + * operations to manage its state across the update.
> + */
> +struct liveupdate_filesystem {
> +	int (*prepare)(struct file *file, void *arg, u64 *data);
> +	int (*freeze)(struct file *file, void *arg, u64 *data);
> +	void (*cancel)(struct file *file, void *arg, u64 data);
> +	void (*finish)(struct file *file, void *arg, u64 data, bool reclaimed);
> +	int (*retrieve)(void *arg, u64 data, struct file **file);
> +	bool (*can_preserve)(struct file *file, void *arg);
> +	const char *compatible;
> +	void *arg;

What is the use for this arg? I would expect one file type/system to
register one set of handlers. So they can keep their arg in a global in
their code. I don't see why a per-filesystem arg is needed.

What I do think is needed is a per-file arg. Each callback gets 'data',
which is the serialized data, but there is no place to store runtime
state, like some flags or serialization metadata. Sure, you could make
place for it somewhere in the inode, but I think it would be a lot
cleaner to be able to store it in struct luo_file.

So perhaps rename private_data in struct luo_file to say
serialized_data, and have a field called "private" that filesystems can
use for their runtime state?

Same suggestion for subsystems as well.

> +	struct list_head list;
> +};
> +
>  /**
>   * struct liveupdate_subsystem - Represents a subsystem participating in LUO
>   * @prepare:      Optional. Called during LUO prepare phase. Should perform
[...]

-- 
Regards,
Pratyush Yadav
